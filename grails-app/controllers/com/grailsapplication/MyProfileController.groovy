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
        String firstName = user.firstName
        String lastName = user.lastName
        String email = user.email
        String mobileNumber = user.mobileNumber
        String userName = user.username
        String sex = user.sex
        String dateOfBirth = user.dateOfBirth
        if (user != null) {
            if (user.password.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                if (firstName != null || email != null || sex != null || userName != null) {
                    log.info("User Details are shown")
                } else {
                    flash.warnmessage = g.message(code: "flash.message.user.warn")
                    log.warn("No User Details Found")
                }
                render view: "myprofile", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName, sex: sex, dateOfBirth: dateOfBirth]

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

        if (user != null) {

            if (firstname.isEmpty() || email.isEmpty() || sex.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.edituser.warn")
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
                flash.successmessage = g.message(code: "myprofile.update.user.success")
            }
        }
        redirect controller: "myProfile", action: "showProfileDetails"
    }
}