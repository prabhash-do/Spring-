package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MyProfileController {

    def springSecurityService
/**
 * Show Current user details from Database
 */
    def showProfileDetails(){
        User user = springSecurityService.currentUser
        String firstName = user.firstname
        String lastName = user.lastname
        String email = user.email
        String mobileNumber = user.mobilenumber
        String userName = user.username


        if (firstName != null || email != null || userName != null) {
            log.info("User Details are shown")
        } else {
            flash.warnmessage = g.message(code: "flash.message.user.warn")
            log.warn("No User Details Found")
        }
        render view: "myprofile", model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName]

    }
/**
 * Allow Current user to update it's details
 */
    def editUserDetails(){

        User user = springSecurityService.currentUser
        String firstname = params.firstname
        String lastname = params.lastname
        String email = params.email
        String mobilenumber = params.mobilenumber

        if (user != null) {

            if (firstname.isEmpty() || email.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.edituser.warn")
                log.warn("Unable to save user details.Some mandatory fields are left blank")
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