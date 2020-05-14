package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.plugin.springsecurity.SpringSecurityService

@Secured(['ROLE_ADMIN'])
class ResetPasswordController {

    def springSecurityService
    static allowedMethods = [resetpassword: "POST"]
    def username = params.username

    def index() {
        render view: '/resetPassword/reset'
    }
/**
 * Allow user to reset password
 * @return true
 */
    def resetpassword() {

        User user = User.findByUsername(username)
        def passwordNew = params.newpassword
        if (!params.newpassword.equals(params.confirmpassword)) {
            log.info("New password and Confirm password not match")
            flash.warnmessage = g.message("flash.message.new.password.mismatch")
            redirect action: "index"

        } else {
            try {
                user.password = passwordNew
                BootStrap.userService.save(user)
                log.info("Password reset Successfully")
                flash.successmessage = g.message("springsecurity.reset.password.success")
                redirect action: 'index'
            } catch (ValidationException e) {
                log.error("Exception occured while Changing password:\n", e)
                flash.warnmessage = g.message("springsecurity.reset.password.fail")
                System.out.println(e)
                redirect action: "index"
            }
        }
    }
}
