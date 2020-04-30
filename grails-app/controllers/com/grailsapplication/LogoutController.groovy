package com.grailsapplication

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class LogoutController {

    static allowedMethods = [logout: 'POST']

    def logout() {
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/logoff'
    }
}

