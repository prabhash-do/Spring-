package com.grailsapplication

import com.util.BaseConstants
import grails.config.Config
import grails.converters.JSON
import grails.core.support.GrailsConfigurationAware
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.session.SessionAuthenticationException

@Secured('permitAll')
class LoginController extends grails.plugin.springsecurity.LoginController implements GrailsConfigurationAware {

    List<String> coordinatePositions

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

    def authfail() {

        flash.errormessage = g.message(code: "login.failed")
        log.error(g.message(code: "login.failed"))
        redirect action: "auth"
    }

    static String setPath() {
        ResourceBundle config = ResourceBundle.getBundle("config")
        def appHome = System.getProperty("APP_HOME") ?: System.getenv("APP_HOME")
        String destinationPath
        if (appHome) {
            String path = new File(appHome);
            destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH_TOMCAT))
        } else {
            String path = new File(".").getCanonicalPath();
            destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH))
        }
        return destinationPath
    }

    static String setPathForFile(String fileName) {
        String destinationPath = setPath()
        String extension = fileName.substring(fileName.lastIndexOf("."))
        if (extension.equalsIgnoreCase(".png") || extension.equalsIgnoreCase(".jpg") || extension.equalsIgnoreCase(".jpeg")) {
            destinationPath = destinationPath.concat(BaseConstants.IMAGES).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".ppt") || extension.equalsIgnoreCase(".pptx") || extension.equalsIgnoreCase(".jar")) {
            destinationPath = destinationPath.concat(BaseConstants.PPTS).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".mp4") || extension.equalsIgnoreCase(".mov") || extension.equalsIgnoreCase(".3gp")) {
            destinationPath = destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".pdf") || extension.equalsIgnoreCase(".txt") || extension.equalsIgnoreCase(".docx") || extension.equalsIgnoreCase(".xls") || extension.equalsIgnoreCase(".xlsx") || extension.equalsIgnoreCase(".csv")) {
            destinationPath = destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator)
        }
        return destinationPath
    }

    @Override
    void setConfiguration(Config co) {
        coordinatePositions = co.getProperty('security.coordinate.positions', List, []) as List<String>
    }
}
