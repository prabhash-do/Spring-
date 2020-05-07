package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_CLIENT'])
class ChangePasswordController {

    def springSecurityService

    def index() {
        render view: '/changePassword/change'
    }

    def changepassword() {
        ResourceBundle message = ResourceBundle.getBundle("messages")
        User user = springSecurityService.currentUser
        def passwordCurrent = params.currentpassword
        def passwordNew = params.newpassword
        def passwordConfirm = params.confirmpassword

        if (!passwordNew.equals(passwordConfirm)) {
            flash.message = message.getString("flash.message.new.password.mismatch")
            redirect action: 'index'
        } else {
            try {
                if (passwordNew.equals(passwordCurrent)) {
                    flash.message = message.getString('flash.message.choose.different.password')
                    render view: '/changePassword/change'
                } else {
                    passwordCurrent = passwordNew
                    user.password = passwordCurrent
                    BootStrap.userService.save(user)

                    flash.message = message.getString("springsecurity.change.password.success")
                    redirect action: "index"
                }
            } catch (ValidationException e) {
                flash.message = message.getString("springsecurity.change.password.fail")
                redirect action: "index"
            }
        }
    }
}
