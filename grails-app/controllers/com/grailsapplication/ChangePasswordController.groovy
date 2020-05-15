package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured('permitAll')
class ChangePasswordController {

    def passwordEncoder
    def springSecurityService
    static allowedMethods = [changepassword: "POST"]

    def index() {
        render view: '/changePassword/change'
    }
/**
 * Allow user to change password
 * @return true
 */
    def changepassword() {

        User user = springSecurityService.currentUser

        if (user != null) {
            if (user.password.isEmpty()) {
                flash.errormessage = g.message(code: "flash.message.user.warn")
                log.warn("No User Details Found")
            } else {
                String passwordCurrent = params.currentpassword
                String passwordNew = params.newpassword
                String passwordConfirm = params.confirmpassword
                try {
                    if (!passwordEncoder.isPasswordValid(user.password,
                            passwordCurrent, null /*salt*/)) {
                        log.warn("Current password is incorrect")
                        flash.errormessage = g.message(code:'flash.message.incorrect.current.password')
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else if (!passwordNew.equals(passwordConfirm)) {
                        log.warn("New Pasword and Confirm password did not match")
                        flash.errormessage = g.message(code:"flash.message.new.password.mismatch")
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else if (passwordEncoder.isPasswordValid(user.password, passwordNew,
                            null /*salt*/)) {
                        log.warn("Please choose a different password from current one")
                        flash.errormessage = g.message(code:'flash.message.choose.different.password')
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else {
                        passwordCurrent = passwordNew
                        user.password = passwordCurrent
                        BootStrap.userService.save(user)

                        log.info("Pasword changed Successfully")
                        flash.successmessage = g.message(code:"springsecurity.change.password.success")
                        redirect action: "index"
                    }
                } catch (ValidationException e) {
                    log.error("Exception occured while Changing password:\n", e)
                    flash.errormessage = g.message(code:"springsecurity.change.password.fail")
                    redirect action: "index"
                }
            }
        }
    }
}




