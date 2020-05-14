package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MyProfileController {

    def springSecurityService
/**
 * Show Current user details from Database
 */
    def showProfileDetails = {
        User user = springSecurityService.currentUser
        def firstName = user.firstname
        def lastName = user.lastname
        def email = user.email
        def mobileNumber = user.mobilenumber
        def userName = user.username


        if (firstName != null || email != null || userName != null) {
            log.info("User Details are shown")
        } else {
            flash.warnmessage = g.message(code: "flash.message.user.warn")
            log.info("No User Details Found")
        }
        render view: "myprofile", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName]

    }
/**
 * Allow Current user to update it's details
 */
    def editUserDetails = {

        User user = springSecurityService.currentUser
        def firstname = params.firstname
        def lastname = params.lastname
        def email = params.email
        def mobilenumber = params.mobilenumber

        if (user != null) {

            if (firstname.isEmpty() || email.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.edituser.warn")
                log.info("Unable to save user details.Some mandatory fields are left blank")
            } else {
                user.firstname = firstname
                user.lastname = lastname
                user.email = email
                user.mobilenumber = mobilenumber
                BootStrap.userService.save(user)
                log.info("User Details are updated")
                flash.successmessage = g.message(code: "myprofile.update.user.success")
            }
        }
        redirect controller: "myProfile", action: "showProfileDetails"
    }
}