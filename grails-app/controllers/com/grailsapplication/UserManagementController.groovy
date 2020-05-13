package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT','ROLE_ADMIN'])
class UserManagementController {

    def index = {
        render view: '/userManagement/user'
    }
}
