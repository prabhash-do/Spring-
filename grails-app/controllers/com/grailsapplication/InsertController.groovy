package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class InsertController {

    def insert() {
        Settings settings=Settings.findByPropertyName("File size")
        if(settings!=null) {
            Double fileSize1 = settings.propertyValue.toDouble()
            render view: "upload", model: [fileSize1: fileSize1]
        }else{
            render view: "upload", model: [fileSize1: "null"]
        }
    }
}