package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class InsertController {

    def insert() {
        render view :"upload"

    }
}
