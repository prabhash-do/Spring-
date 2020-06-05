package com.grailsapplication

import com.company.SendMail
import com.company.SendSms
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import java.util.stream.Collectors

class UserManagementController {

    def springSecurityService
    def passwordEncoder

    @Secured('permitAll')
    def index() {

        def listuser = User.list()
        String message;
        User user = springSecurityService.currentUser
        def currentuser = [user]
        listuser.remove(user)
        if (chainModel != null && chainModel.containsKey('message')) {
            message = chainModel.get('message')
        }
        render view: '/userManagement/listUser', model: [listuser: listuser, currentuser: currentuser, message: message]
    }

    def doMailUserCreate(def userName) {
        User user = springSecurityService.currentUser
        String action = "user_creation"
        SendMail.mail(userName, user.email, action)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMSUserCreate(def userName) {
        User user = springSecurityService.currentUser
        String action = "user_creation"
        SendSms.sendsms(userName, user.mobileNumber, action)
        log.info("SMS has been sent successfully!")
        flash.messagesms = g.message(code: "flash.message.sms")
    }

    def doMailResetPassword() {
        User user = springSecurityService.currentUser
        String action = "reset_password"
        SendMail.mail("", user.email, action)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMSResetPassword() {
        User user = springSecurityService.currentUser
        String action = "reset_password"
        SendSms.sendsms("", user.email, action)
        log.info("SMS has been sent successfully!")
        flash.messagesms = g.message(code: "flash.message.sms")
    }

    def userList() {

        def listuser = User.list()

        render template: "/templates/recentUsers", model: [listuser: listuser]
    }

    @Secured('permitAll')
    def change() {
        render view: '/userManagement/changePassword'
    }

    @Secured(['ROLE_ADMIN'])
    def reset() {
        String username = params.username
        render view: '/userManagement/resetPassword', model: [username: username]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        String message;
        if (chainModel != null && chainModel.containsKey('message')) {
            message = chainModel.get('message')
        }
        render view: '/userManagement/createUser', model: [message: message]
    }
    /**
     * This method allows a user to change password
     * @return boolean
     */
    @Secured('permitAll')
    def changePassword() {

        User user = springSecurityService.currentUser

        if (user != null) {
            if (user.password.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                String passwordCurrent = params.currentpassword
                String passwordNew = params.password
                try {
                    if (!passwordEncoder.isPasswordValid(user.password,
                            passwordCurrent, null /*salt*/)) {
                        log.warn("Current password is incorrect")
                        flash.warnmessage = g.message(code: 'flash.message.incorrect.current.password')
                        render view: '/userManagement/changePassword', model: [currentpassword: passwordCurrent]
                    } else if (passwordEncoder.isPasswordValid(user.password, passwordNew, null /*salt*/)) {
                        log.warn("Please choose a different password from current one")
                        flash.warnmessage = g.message(code: 'flash.message.choose.different.password')
                        render view: '/userManagement/changePassword', model: [currentpassword: passwordCurrent]
                    } else {
                        passwordCurrent = passwordNew
                        user.password = passwordCurrent
                        BootStrap.userService.save(user)

                        log.info("Pasword changed Successfully")
                        flash.successmessage = g.message(code: "springsecurity.change.password.success")
                        redirect action: "change"
                    }
                } catch (ValidationException e) {
                    log.error("Exception occured while Changing password:\n", e)
                    flash.errormessage = g.message(code: "springsecurity.change.password.fail")
                    redirect action: "change"
                }
            }
        }
    }
    /**
     * This method allows a ROLE_ADMIN llow user to reset password of other users
     * @return boolean
     */
    @Secured(['ROLE_ADMIN'])
    def resetPassword() {

        String username = params.username
        String passwordNew = params.password
        String message;
        User user = User.findByUsername(username)
        if (user != null) {
            if (user.password.isEmpty()) {
                message = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                try {
                    user.password = passwordNew
                    BootStrap.userService.save(user)

                    Settings settings1 = Settings.findByPropertyName("Email_Password_Change")
                    if (settings1 != null) {
                        if (settings1.propertyValue == "on") {
                            doMailResetPassword()
                        }
                    }

                    Settings settings2 = Settings.findByPropertyName("Sms_Password_Change")
                    if (settings2 != null) {
                        if (settings2.propertyValue == "on") {
                            doSMSResetPassword()
                        }
                    }

                    log.info("Password reset Successfully")
                    message = g.message(code: "springsecurity.reset.password.success", args: [username])
                    chain(action: "index", model: [message: message])
                } catch (ValidationException e) {
                    log.error("Exception occured while reseting password:\n", e)
                    message = g.message(code: "springsecurity.reset.password.fail", args: [username])
                    chain(action: "index", model: [message: message])
                }
            }
        } else {
            log.warn("No User Found")
            message = g.message(code: "flash.message.choose.user.warn")
            chain(action: "index", model: [message: message])
        }
    }


    /**
     * This method allows a ROLE_ADMIN user to create a new User
     */
    @Secured(['ROLE_ADMIN'])
    def createUser() {
        String firstName = params.firstname
        String lastName = params.lastname
        String email = params.email
        String mobileNumber = params.mobilenumber
        String sex = params.sex
        String dateOfBirth = params.dateofbirth
        String userName = params.username
        String password = params.password
        String roleId = params.roleid

        try {
            User u = new User(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, username: userName, password: password, sex: sex, dateOfBirth: dateOfBirth)
            BootStrap.BANKCARD.each { k, v ->
                u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
            }
            Role role = Role.findById(roleId.toLong())
            u = BootStrap.userService.save(u)
            BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority(role.authority))

            Settings settings1 = Settings.findByPropertyName("Email_User_Creation")
            if (settings1 != null) {
                if (settings1.propertyValue == "on") {
                    doMailUserCreate(userName)
                }
            }

            Settings settings2 = Settings.findByPropertyName("Sms_User_Creation")
            if (settings2 != null) {
                if (settings2.propertyValue == "on") {
                    doSMSUserCreate(userName)
                }
            }

            log.info("New user has been created Successfully")
            String message = g.message(code: "flash.message.create.user.success", args: [u.username])
            chain(controller: 'userManagement', action: 'index', model: [message: message]);
        } catch (ValidationException e) {
            log.error("Fail to create new user\n", e)
            String message = g.message(code: "flash.message.create.user.fail")
            chain(action: "create", model: [message: message])
        }
    }
    /**
     * This method allows a ROLE_ADMIN user to show user details of any User
     */
    @Secured(['ROLE_ADMIN'])
    def editUser() {
        String username = params.username
        User user = User.findByUsername(username)
        UserRole userRole = UserRole.findByUser(user)
        String firstName = user.firstName
        String lastName = user.lastName
        String email = user.email
        String mobileNumber = user.mobileNumber
        String userName = user.username
        String sex = user.sex
        String dateOfBirth = user.dateOfBirth
        String userId = user.id
        String role = userRole.role
        String roleId = userRole.role.id
        String message
        if (chainModel != null && chainModel.containsKey('message')) {
            message = chainModel.get('message')
        }
        if (user != null || userRole != null) {
            if (firstName != null || email != null || sex != null || userName != null) {
                log.info("User Details are shown")
            } else {
                message = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            }
            render view: "editUser", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName, sex: sex, dateOfBirth: dateOfBirth, userId: userId, role: role, roleId: roleId, message: message]
        } else {
            log.warn("No User Found")
            message = g.message(code: "flash.message.no.user.found")
            chain(action: "index", params: [message: message])
        }
    }
    /**
     * This method allows a ROLE_ADMIN user to update user details of any User
     */
    @Secured(['ROLE_ADMIN'])
    def editUserDetails() {

        String username = params.username
        User user = User.findByUsername(username)
        UserRole userRole = UserRole.findByUser(user)
        Role role
        String message
        String userId = user.id
        String firstName = params.firstname
        String lastName = params.lastname
        String email = params.email
        String userName = user.username
        String mobileNumber = params.mobilenumber
        String sex = params.sex
        String dateOfBirth = params.dateofbirth
        String roleId = params.roleid

        if (user != null || userRole != null) {

            if (firstName.isEmpty() || email.isEmpty()) {
                String fName = user.firstName
                String uEmail = user.email
                String uRoleId = userRole.role.id
                String uRoleName = userRole.role
                message = g.message(code: "flash.message.edituser.warn")
                log.warn("Unable to save user details.Some mandatory fields are left blank")
                render view: "editUser", model: [firstName: fName, lastName: lastName, email: uEmail, mobileNumber: mobileNumber, sex: sex, dateOfBirth: dateOfBirth, userName: userName, userId: userId, role: uRoleName, roleId: uRoleId, message: message]
            } else {
                user.firstName = firstName
                user.lastName = lastName
                user.email = email
                user.mobileNumber = mobileNumber
                user.sex = sex
                user.dateOfBirth = dateOfBirth

                BootStrap.userRoleService.delete(user)
                role = Role.findById(roleId.toLong())
                User u = BootStrap.userService.save(user)
                BootStrap.userRoleService.save(u, role)
                log.info("User Details are updated")
                message = g.message(code: "update.user.success", args: [user.username])
                render view: "editUser", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, sex: sex, dateOfBirth: dateOfBirth, userName: userName, userId: userId, role: role, roleId: roleId, message: message]
            }
        } else {
            log.warn("No User Found")
            message = g.message(code: "flash.message.no.user.found")
            chain(action: "index", params: [message: message])
        }
    }
/**
 * This method allows a ROLE_ADMIN user to delete any user except the user who has logged in
 * @return
 */
    @Secured(['ROLE_ADMIN'])
    def deleteUser() {

        User user = User.findById(params.userid)
        BootStrap.userRoleService.delete(user)
        user.delete(flush: true)
        redirect action: "index"

    }

    @Secured('permitAll')
    def searchUser() {
        User user = springSecurityService.currentUser
        String searchUser = params.srch
        List<User> userList = User.listOrderByUsername()
        String message;
        try {
            if (searchUser.isEmpty()) {
                message = g.message(code: "flash.message.user.search.name.empty.warn")
                log.info("the username to search is not specified")
                chain(action: "index", model: [message: message])
            } else {
                List<String> userName = []
                for (User user1 : userList) {
                    userName.add(user1.username)
                }
                List<User> result
                if (userName.findAll().toString().toLowerCase().contains(searchUser.toLowerCase())) {
                    result = User.findAllByUsernameRlike(searchUser.toLowerCase())
                    result.remove(user)
                    log.info("search result is" + result.toString());
                    if ((user.username).toLowerCase().contains(searchUser.toLowerCase())) {
                        render view: "/userManagement/listUser", model: [currentuser: user, listuser: result]
                    } else {
                        render view: "/userManagement/listUser", model: [listuser: result]
                    }

                } else {
                    message = g.message(code: "flash.message.search.not.found.warn")
                    log.error("User not found")
                    chain(action: "index", model: [message: message])
                }
            }
        }
        catch (Exception) {
            message = g.message(code: "flash.message.unknown.exception")
            render(view: "listUser", model: [message: message])
        }
    }
}
