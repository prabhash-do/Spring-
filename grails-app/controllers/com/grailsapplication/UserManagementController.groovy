package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserManagementController {

    def index (){

        def listuser = User.list()
        render view: '/userManagement/user',model:[listuser : listuser]
    }
}
