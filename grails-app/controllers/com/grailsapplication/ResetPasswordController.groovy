package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class ResetPasswordController {

    def index() {
        render view: '/resetPassword/reset'
    }
    def resetpassword(){
        ResourceBundle message = ResourceBundle.getBundle("messages");
        if (!params.password.equals(params.confirmpassword)) {
            flash.message = message.getString("flash.message.new.password.mismatch")
            redirect action: "index"
            return
        } else {
            render 'hello'
        }
    }
}
