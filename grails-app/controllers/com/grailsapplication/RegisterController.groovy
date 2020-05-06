package com.grailsapplication

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.grailsapplication.User
import com.grailsapplication.Role
import com.grailsapplication.UserRole

@Transactional
@Secured('permitAll')
class RegisterController {

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
                flash.message = message.getString("flash.message.register.success")
                redirect controller: "login", action: "auth"

            } catch (ValidationException e) {
                flash.message = message.getString("flash.message.register.fail")
                System.out.println(e)
                redirect action: "index"
                return
            }
        }
    }
}

