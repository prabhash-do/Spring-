package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

class SecuredController {

    @Secured(['ROLE_CLIENT', 'ROLE_ADMIN'])
    def index() {
        if (isLoggedIn()) {
            new ListingController().doListing()
        } else {
            redirect controller: "login", action: "auth"
        }
    }
}
