package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

class UserManagementController {

    def springSecurityService
    def passwordEncoder

    @Secured('permitAll')
    def index() {

        def listuser = User.list()
        User user = springSecurityService.currentUser
        def currentuser = [user]
        listuser.remove(user)
        String message = params.message
        render view: '/userManagement/listUser', model: [listuser: listuser, currentuser: currentuser, message: message]
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
        String message = params.message
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
        User user = User.findByUsername(username)
        if (user != null) {
            if (user.password.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                try {
                    user.password = passwordNew
                    BootStrap.userService.save(user)
                    log.info("Password reset Successfully")
                    flash.successmessage = g.message(code: "springsecurity.reset.password.success")
                    redirect action: "reset"
                } catch (ValidationException e) {
                    log.error("Exception occured while reseting password:\n", e)
                    flash.errormessage = g.message(code: "springsecurity.reset.password.fail")
                    redirect action: "reset"
                }
            }
        } else {
            log.warn("No User Found")
            String message = g.message(code: "flash.message.choose.user.warn")
            forward(action: "index", params: [message: message])
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

        try {
            User u = new User(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, username: userName, password: password, sex: sex, dateOfBirth: dateOfBirth)
            BootStrap.BANKCARD.each { k, v ->
                u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
            }
            u = BootStrap.userService.save(u)
            BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority('ROLE_CLIENT'))
            log.info("New user has been created Successfully")
            String message = g.message(code: "flash.message.create.user.sucess", args: [u.username])
            forward(controller: "userManagement", action: "index", params: [message: message])

        } catch (ValidationException e) {
            log.error("Fail to create new user\n", e)
            String message = g.message(code: "flash.message.create.user.fail")
            forward(action: "create", params: [message: message])
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
        flash.successmessage = user.username + " " + g.message(code: "flash.message.user.delete")
        redirect action: "index"

    }
}


