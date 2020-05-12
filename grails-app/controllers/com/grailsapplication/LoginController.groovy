package com.grailsapplication

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.web.WebAttributes

@Secured('permitAll')
class LoginController extends grails.plugin.springsecurity.LoginController implements GrailsConfigurationAware {

    List<String> coordinatePositions
    ResourceBundle message = ResourceBundle.getBundle("messages");
    def auth() {

        ConfigObject conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        Collections.shuffle(coordinatePositions)
        String position = coordinatePositions.first()

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [postUrl            : postUrl,
                                     rememberMeParameter: conf.rememberMe.parameter,
                                     usernameParameter  : conf.apf.usernameParameter,
                                     passwordParameter  : conf.apf.passwordParameter,
                                     gspLayout          : conf.gsp.layoutAuth,
                                     position           : position]
    }

    def authfail(){

        flash.message = message.getString("login.failed")
        log.error(message.getString("login.failed"))
        redirect action: "auth"
    }

    @Override
    void setConfiguration(Config co) {
        coordinatePositions = co.getProperty('security.coordinate.positions', List, []) as List<String>
    }
}
