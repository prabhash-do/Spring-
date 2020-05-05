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
    RoleService roleService
    UserService userService
    UserRoleService userRoleService

    def index() {}

    def register() {
        if (!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } else {
            try {

//                CredentialMatching.doSave(username, password)

                User u = new User(firstname: params.firstname,lastname: params.lastname,mobilenumber: params.mobilenumber, username: params.username, password: params.password)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                u = userService.save(u)
                userRoleService.save(u, roleService.findByAuthority('ROLE_CLIENT'))
                flash.message = "You have registered successfully. Please login."
                redirect controller: "login", action: "auth"

            } catch (ValidationException e) {
                flash.message = "Register Failed"
                System.out.println(e)
                redirect action: "index"
                return
            }
        }
    }
}

