package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PreviewController {

    def index() {}

    def preview() {
        def errorMessage
        def filename = params.filename
        def ex = filename.substring(filename.lastIndexOf("."));
        if (ex.equalsIgnoreCase(".pdf")|| ex.equalsIgnoreCase(".txt")) {

            render view: "/pdfReader/pdfReader", model: [filename: filename]  /*render to pdf viewer.*/
            log.info ("Controller is Rendered to the pdf Reader.")
        } else if (ex.equalsIgnoreCase(".pptx")||ex.equalsIgnoreCase(".ppt")) {
            render view: "/pptReader/pptReader", model: [filename: filename]/*render to ppt  player.*/
            log.info ("Controller is Rendered to the ppt previewer.")
        } else if (ex.equalsIgnoreCase(".mp4")) {
            def videoflag = "true"   /*render to video player.*/
            render template: "/templates/play", model: [filename: filename, videoflag: videoflag]
            log.info ("Controller is Rendered to the video player.")
        } else {
            redirect controller: "listing", action: "doListing"
            errorMessage = g.message(code: 'flash.message.file.cannot.previewed');
            flash.error = errorMessage
        }
    }
}