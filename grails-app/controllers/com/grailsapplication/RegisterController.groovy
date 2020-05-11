package com.grailsapplication

import grails.plugin.simplecaptcha.SimpleCaptchaService
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.grailsapplication.User
import com.grailsapplication.Role
import com.grailsapplication.UserRole

@Transactional
@Secured('permitAll')
class RegisterController {

    SimpleCaptchaService simpleCaptchaService
    static allowedMethods = [register: "POST"]

    def index(){}

    def register() {
        ResourceBundle message = ResourceBundle.getBundle("messages");
        if (!params.password.equals(params.repassword)) {
            log.warn('Password and Confirm Password are not match')
            flash.warnmessage = message.getString("flash.message.password.mismatch")
            redirect action: "index"
        } else {
            try {
                User u = new User(firstname: params.firstname, lastname: params.lastname, email: params.email, mobilenumber: params.mobilenumber, username: params.username, password: params.password)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                boolean b = simpleCaptchaService.validateCaptcha(params.captcha)
                if (b) {
                    u = BootStrap.userService.save(u)
                    BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority('ROLE_CLIENT'))
                    log.info('You have Successfully registered')
                    flash.successmessage = message.getString("flash.message.register.success")
                    redirect controller: "login", action: "auth"
                } else {
                    log.warn('please provide a valid Captcha')
                    flash.warnmessage = message.getString("flash.message.incorrect.captcha")
                    redirect action: 'index'
                }
            } catch (ValidationException e) {
                log.error('Error occured.Unable to Register')
                flash.warnmessage = message.getString("flash.message.register.fail")
                redirect action: "index"
            }
        }
    }
}

