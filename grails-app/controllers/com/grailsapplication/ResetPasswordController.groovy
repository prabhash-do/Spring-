package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.plugin.springsecurity.SpringSecurityService

@Secured(['ROLE_ADMIN'])
class ResetPasswordController {

    static allowedMethods = [resetpassword: "POST"]
    String username = params.username

    def index() {
        render view: '/resetPassword/reset'
    }
/**
 * Allow user to reset password
 * @return true
 */
    def resetpassword() {

        User user = User.findByUsername(username)
        String passwordNew = params.newpassword
        if (!params.newpassword.equals(params.confirmpassword)) {
            log.warn("New password and Confirm password not match")
            flash.errormessage = g.message(code: "flash.message.new.password.mismatch")
            redirect action: "index"

        } else {
            try {
                user.password = passwordNew
                BootStrap.userService.save(user)
                log.info("Password reset Successfully")
                flash.successmessage = g.message(code: "springsecurity.reset.password.success")
                redirect action: 'index'
            } catch (ValidationException e) {
                log.error("Exception occured while Changing password:\n", e)
                flash.errormessage = g.message(code: "springsecurity.reset.password.fail")
                redirect action: "index"
            }
        }
    }
}
