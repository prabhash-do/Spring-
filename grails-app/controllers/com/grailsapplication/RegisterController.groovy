package com.grailsapplication

import grails.plugin.simplecaptcha.SimpleCaptchaService
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
@Secured('permitAll')
class RegisterController {

    SimpleCaptchaService simpleCaptchaService

    static allowedMethods = [register: "POST"]

    def index() {}

    def register() {
        ResourceBundle message = ResourceBundle.getBundle("messages");
        if (!params.password.equals(params.repassword)) {
            flash.message = message.getString("flash.message.password.mismatch")
            redirect action: "index"
            return
        } else {
            try {
                User u = new User(firstname: params.firstname, lastname: params.lastname, email: params.email, mobilenumber: params.mobilenumber, username: params.username, password: params.password)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                u = BootStrap.userService.save(u)
                BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority('ROLE_CLIENT'))

                boolean b = simpleCaptchaService.validateCaptcha(params.captcha)
                if(b) {
                    flash.message = message.getString("flash.message.register.success")
                    redirect controller: "login", action: "auth"
                }
                else{
                    flash.message = message.getString("flash.message.incorrect.captcha")
                    redirect action:'index'
                }
            } catch (ValidationException e) {
                System.out.println("Validation Exception "+e)
                flash.message = message.getString("flash.message.register.fail")
                System.out.println(e)
                redirect action: "index"
                return
            }
        }
    }
}

