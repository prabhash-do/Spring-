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
//        ResourceBundle message = ResourceBundle.getBundle("messages")
        User user = springSecurityService.currentUser

        if (user != null) {
            if (user.password.isEmpty()) {
                flash.warnmessage = g.message(code: "flash.message.user.warn")
                log.info("No User Details Found")
            } else {
                def passwordCurrent = params.currentpassword
                def passwordNew = params.newpassword
                def passwordConfirm = params.confirmpassword
                try {
                    if (!passwordEncoder.isPasswordValid(user.password,
                            passwordCurrent, null /*salt*/)) {
                        log.info("Current password is incorrect")
                        flash.warnmessage = message.getString('flash.message.incorrect.current.password')
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else if (!passwordNew.equals(passwordConfirm)) {
                        log.info("New Pasword and Confirm password did not match")
                        flash.warnmessage = message.getString("flash.message.new.password.mismatch")
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else if (passwordEncoder.isPasswordValid(user.password, passwordNew,
                            null /*salt*/)) {
                        log.info("Please choose a different password from current one")
                        flash.warnmessage = message.getString('flash.message.choose.different.password')
                        render view: '/changePassword/change', model: [currentpassword: passwordCurrent]
                    } else {
                        passwordCurrent = passwordNew
                        user.password = passwordCurrent
                        BootStrap.userService.save(user)

                        log.info("Pasword changed Successfully")
                        flash.successmessage = message.getString("springsecurity.change.password.success")
                        redirect action: "index"
                    }
                } catch (ValidationException e) {
                    log.error("Exception occured while Changing password:\n", e)
                    flash.warnmessage = message.getString("springsecurity.change.password.fail")
                    redirect action: "index"
                }
            }
        }
    }
}




