package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MyProfileController {

    def springSecurityService
/**
 * Show Current user details from Database
 */
    def showProfileDetails() {
        User user = springSecurityService.currentUser
        UserRole userRole = UserRole.findByUser(user)
        String firstName = user.firstName
        String lastName = user.lastName
        String email = user.email
        String mobileNumber = user.mobileNumber
        String userName = user.username
        String sex = user.sex
        String dateOfBirth = user.dateOfBirth
        String role = userRole.role
        String message
        if (chainModel != null && chainModel.containsKey('message')) {
            message = chainModel.get('message')
        }
        if (user != null) {
            if (user.password.isEmpty()) {
               message = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                if (firstName != null || email != null || sex != null || userName != null) {
                    log.info("User Details are shown")
                } else {
                    message = g.message(code: "flash.message.user.warn")
                    log.warn("No User Details Found")
                }
                render view: "myprofile", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName, sex: sex, dateOfBirth: dateOfBirth, role: role, message: message]

            }
        }
    }
/**
 * Allow Current user to update it's details
 */
    def editUserDetails() {

        User user = springSecurityService.currentUser
        String firstname = params.firstname
        String lastname = params.lastname
        String email = params.email
        String mobilenumber = params.mobilenumber
        String sex = params.sex
        String dateofbirth = params.dateofbirth
        String message

        if (user != null) {

            if (firstname.isEmpty() || email.isEmpty() || sex.isEmpty()) {
                message = g.message(code: "flash.message.edituser.warn")
                log.warn("Unable to save user details.Some mandatory fields are left blank")
            } else {
                user.firstName = firstname
                user.lastName = lastname
                user.email = email
                user.mobileNumber = mobilenumber
                user.sex = sex
                user.dateOfBirth = dateofbirth

                BootStrap.userService.save(user)
                log.info("User Details are updated")
                message = g.message(code: "myprofile.update.user.success")
            }
        }
        chain(controller: "myProfile", action: "showProfileDetails", model: [message: message])
    }
}