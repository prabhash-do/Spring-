package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class MyProfileController {

    def springSecurityService
    static allowedMethods = [showProfileDetails: "POST",editUserDetails: "POST"]
    ResourceBundle message = ResourceBundle.getBundle("messages")

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


            if (firstName!=null || email!=null || userName!=null) {
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

        user.firstname = params.firstname
        user.lastname = params.lastname
        user.email = params.email
        user.mobilenumber = params.mobilenumber
        BootStrap.userService.save(user)
        log.info("User Details are updated")
        flash.successmessage = message.getString("myprofile.update.user.success")

        redirect controller: 'myProfile', action: 'showProfileDetails'
    }
}
