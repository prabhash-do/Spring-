package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

import javax.xml.bind.ValidationException

@Secured(['ROLE_ADMIN'])
class CreateUserController {

    static allowedMethods = [createUser: "POST"]
    ResourceBundle message = ResourceBundle.getBundle("messages");

    def index() {
        render view: '/userManagement/createUser'
    }
/**
 * This method allows to create a new User of ROLE_CLIENT
 */
    def createUser={
        if (!params.password.equals(params.repassword)) {
            log.info("New Pasword and Confirm password did not match")
            flash.warnmessage = message.getString("flash.message.password.mismatch")
            redirect action: "index"
        } else {
            try {
                User u = new User(firstname: params.firstname, lastname: params.lastname, email: params.email, mobilenumber: params.mobilenumber, username: params.username, password: params.password)
                BootStrap.BANKCARD.each { k, v ->
                    u.addToCoordinates(new SecurityCoordinate(position: k, value: v, user: u))
                }
                u = BootStrap.userService.save(u)
                BootStrap.userRoleService.save(u, BootStrap.roleService.findByAuthority('ROLE_CLIENT'))
                log.info("New user has been created Successfully")
                flash.successmessage = message.getString("flash.message.create.user.sucess")
                redirect controller: "userManagement", action: "index"

            } catch (ValidationException e) {
                log.info("Fail to create new user")
                flash.warnmessage = message.getString("flash.message.create.user.fail")
                System.out.println(e)
                redirect action: "index"
            }
        }
    }
}
