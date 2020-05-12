package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class UserManagementController {

    def index = {
        render view: '/userManagement/user'
    }
}
