package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class UserManagementController {

    def springSecurityService
    def index (){

        def listuser = User.list()
        User user = springSecurityService.currentUser
        def currentuser = [user]
        listuser.remove(user)
        render view: '/userManagement/user',model:[listuser : listuser,currentuser: currentuser]
    }
}
