package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class ChangePasswordController {

    def index() {
        render view:'/changePassword/change'
    }
    def changepassword(){
        ResourceBundle message = ResourceBundle.getBundle("messages");
        if (!params.newpassword.equals(params.confirmpassword)) {
            flash.message = message.getString("flash.message.new.password.mismatch")
            redirect action: "index"
            return
        } else {
            render 'hello'
        }
    }
}
