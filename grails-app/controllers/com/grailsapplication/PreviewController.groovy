package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class PreviewController {

    def index() {}

    def preview() {
        def filename = params.filename
        def ex = filename.substring(filename.lastIndexOf("."));
        if (ex.equalsIgnoreCase(".pdf")|| ex.equalsIgnoreCase(".txt")) {

            render view: "/pdfReader/pdfReader", model: [filename: filename]  /*render to pdf viewer.*/
        } else if (ex.equalsIgnoreCase(".pptx")) {
            /*render to ppt  player.*/
            render view: "/pdfReader/pdfReader"

        } else if (ex.equalsIgnoreCase(".mp4")) {
            def videoflag = "true"   /*render to video player.*/

            render template: "/templates/play", model: [filename: filename, videoflag: videoflag]
        } else {
            redirect controller: "listing", action: "doListing"
            flash.error = g.message(code: "flash.message.file.cannot.previewed")
            println(g.message(code: "flash.message.file.cannot.previewed"))
        }
    }
}
