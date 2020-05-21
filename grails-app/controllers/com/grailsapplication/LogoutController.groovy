package com.grailsapplication

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class LogoutController {
    def logout() {
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl /* '/logoff'*/
    }
}

