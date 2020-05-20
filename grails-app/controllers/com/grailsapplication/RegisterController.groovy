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

    def index() {
        render view: "/register/index"
    }

    def register() {
        String firstName = params.firstname
        String lastName = params.lastname
        String email = params.email
        String mobileNumber = params.mobilenumber
        String sex = params.sex
        String dateOfBirth = params.dateofbirth
        String userName = params.username
        String password = params.password
        String passwordConfirm = params.confirmpassword
        String captcha = params.captcha
        if (!password.equals(passwordConfirm)) {
            log.warn("New Password and Confirm password did not match")
            flash.warnmessage = g.message(code: "flash.message.new.password.mismatch")
            render view: '/userManagement/createUser', model: [firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName, sex: sex, dateOfBirth: dateOfBirth]
        } else {
            try {
                User u = new User(firstName: firstName, lastName: lastName, email: email, mobileNumber: mobileNumber, userName: userName, sex: sex, dateOfBirth: dateOfBirth)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                boolean b = simpleCaptchaService.validateCaptcha(captcha)
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

