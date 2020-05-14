package com.grailsapplication

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.springframework.context.EnvironmentAware
import org.springframework.core.env.ConfigurableEnvironment
import org.springframework.core.env.Environment
import org.springframework.core.env.PropertiesPropertySource

class Application extends GrailsAutoConfiguration implements EnvironmentAware {
    static void main(String[] args) {
        GrailsApp.run(Application, args)
    }

    void setEnvironment(Environment environment) {
        def appHome = System.getProperty("APP_HOME") ?: System.getenv("APP_HOME")
        def datasourcefileName = "datasource.groovy"
        if (appHome) {
            appHome = appHome.substring(0, appHome.lastIndexOf(File.separator + "webapps" + File.separator)) + File.separator + "App-DataFiles"
        } else {
            appHome = "${System.getProperty('user.dir')}/grails-app/conf"
        }

        def datasourcepath = new File(appHome, datasourcefileName)
        println "Loading external configuration for DataSource : ${datasourcepath?.absolutePath}"

        if (datasourcepath.exists()) {
            def dsconfig = new ConfigSlurper().parse(datasourcepath.toURL())
            ConfigurableEnvironment cenv = (ConfigurableEnvironment) environment;
            cenv.propertySources.addFirst(new PropertiesPropertySource("external.datasource", dsconfig))
        } else {
            println "External DataSource could not be found, checked ${datasourcepath.absolutePath}"
        }
        appHome = System.getenv("LOGGING_CONFIG")
        if (appHome)
            println "Loading external configuration for logback : ${appHome}"
    }
}