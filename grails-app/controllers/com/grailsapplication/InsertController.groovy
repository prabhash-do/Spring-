package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class InsertController {

    def insert() {
        String message=null;
        Settings settings=Settings.findByPropertyName("File size")
        if (chainModel!=null && chainModel.containsKey('message')) {
            message = chainModel.get('message')
        }

        if(settings!=null) {
            Double fileSize1 = settings.propertyValue.toDouble()
            if (message!=null) {
                render view: "upload", model: [fileSize1: fileSize1, message: message]
            }
            else {
                render view: "upload", model: [fileSize1: fileSize1]
            }
        }else{
            render view: "upload"
        }
    }
}
