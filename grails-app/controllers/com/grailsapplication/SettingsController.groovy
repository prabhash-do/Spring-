package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class SettingsController {

    def index() { }
    def doSettings() {
        Settings settings=Settings.findByPropertyName("File size")
        if(settings!=null) {
            Double fileSize1 = settings.propertyValue.toDouble()
            render view: "settings", model: [fileSize1: fileSize1]
        }else{
            render view: "settings"
        }
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
        Double fileSize1 = settings.propertyValue.toDouble()
        String message= g.message(code: "file.size.limit.save.alert", args: [fileSize1])
        render view: "settings", model: [fileSize1: fileSize1, message: message]
    }
}
