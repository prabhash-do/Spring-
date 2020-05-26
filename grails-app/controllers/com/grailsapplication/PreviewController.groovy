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

            log.info ("Controller is Rendered to the pdf Reader.")
            render view: "/pdfReader/pdfReader", model: [filename: filename]  /*render to pdf viewer.*/

        } else if (ex.equalsIgnoreCase(".pptx")||ex.equalsIgnoreCase(".ppt")) {
            log.info ("Controller is Rendered to the ppt previewer.")
            render view: "/pptReader/pptReader", model: [filename: filename]/*render to ppt  player.*/

        } else if (ex.equalsIgnoreCase(".mp4") || ex.equalsIgnoreCase(".mov") || ex.equalsIgnoreCase(".avi") || ex.equalsIgnoreCase(".mpg") || ex.equalsIgnoreCase(".ogg") || ex.equalsIgnoreCase(".webm") || ex.equalsIgnoreCase(".3gp")) {

            def videoflag = "true"   /*render to video player.*/
            log.info ("Controller is Rendered to the video player.")
            render template: "/templates/play", model: [filename: filename, videoflag: videoflag]

        } else {

            redirect controller: "listing", action: "doListing"
            errorMessage = g.message(code: 'flash.message.file.cannot.previewed');
            flash.error = errorMessage
        }
    }

}
