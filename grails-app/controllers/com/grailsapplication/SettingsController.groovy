package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class SettingsController {

    def index() { }
    def doSettings() {
        boolean setting_flag=true
        render view: "settings", model: []
    }
    def doSubmitSettings() {
        Settings settings = Settings.findByPropertyName("File size")
        if(settings!=null){
            settings.propertyValue = params.propertyValue
            settings.save(flush:true)
        }
        else{
            settings = new Settings()
            settings.propertyName = "File size"
            settings.propertyValue = params.propertyValue
            settings.insert(flush:true)
        }
        new ListingController().doListing()
    }
}
