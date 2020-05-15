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
        if (!params.password.equals(params.repassword)) {
            flash.warnmessage = g.message(code: "flash.message.new.password.mismatch")
            log.warn("New Passowrd and Confirm password not match")
            redirect action: "index"
            return
        } else {
            try {
                User u = new User(firstname: params.firstname, lastname: params.lastname, email: params.email, mobilenumber: params.mobilenumber, username: params.username, password: params.password)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                boolean b = simpleCaptchaService.validateCaptcha(params.captcha)
                if (b) {
                    u = BootStrap.userService.save(u)
                    BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority('ROLE_ADMIN'))
                    log.info('You have Successfully registered')
                    flash.successmessage = g.message(code: "flash.message.register.success")
                    redirect controller: "login", action: "auth"
                } else {
                    log.warn('please provide a valid Captcha')
                    flash.warnmessage = g.message(code: "captcha.mismatch")
                    redirect action: 'index'
                }
            } catch (ValidationException e) {
                log.error('Error occured.Unable to Register')
                flash.errormessage = g.message(code: "flash.message.register.fail")
                redirect action: "index"
            }
        }
    }
}

