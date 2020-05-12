package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import grails.plugin.springsecurity.SpringSecurityService

@Secured(['ROLE_ADMIN'])
class ResetPasswordController {

    def springSecurityService

    def index() {
        render view: '/resetPassword/reset'
    }
/**
 * Allow user to reset password
 * @return true
 */
    def resetpassword() {
        ResourceBundle message = ResourceBundle.getBundle("messages")
        User user = springSecurityService.currentUser
        if (user != null) {
            if (user.password.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.user.warn")
                log.info("No User Details Found")
            } else {
                def passwordNew = params.newpassword
                if (!params.newpassword.equals(params.confirmpassword)) {
                    log.info("New password and Confirm password not match")
                    flash.warnmessage = message.getString("flash.message.new.password.mismatch")
                    redirect action: "index"

                } else {
                    try {
                        user.password = passwordNew
                        BootStrap.userService.save(user)
                        log.info("Password reset Successfully")
                        flash.successmessage = message.getString("springsecurity.reset.password.success")
                        redirect action: 'index'
                    } catch (ValidationException e) {
                        log.error("Exception occured while Changing password:\n", e)
                        flash.warnmessage = message.getString("springsecurity.reset.password.fail")
                        System.out.println(e)
                        redirect action: "index"

                    }
                }
            }
        }
    }
}