package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class InsertController {

    def insert() {
        render view :"upload"
    }
}
