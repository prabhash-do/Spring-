package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class PreviewController {

    def index() {}

    def preview() {
        def filename = params.filename
        def ex = filename.substring(filename.lastIndexOf("."));
        if (ex.equalsIgnoreCase(".pdf")) {

            /*render to pdf viewer.*/
            redirect controller: "preview", action: "pdf"

        } else if (ex.equalsIgnoreCase(".pptx")) {
            /*render to ppt  player.*/

        } else if (ex.equalsIgnoreCase(".mp4")) {
            println("mp4444444444444")
            def vedioflag = "true"

            /*render to video player.*/
//            render view: "../listing/list", model: [filename: filename, vedioflag: vedioflag]
            render template: "/templates/play", model: [filename: filename, vedioflag: vedioflag]
        } else {
            redirect controller: "listing", action: "doListing"
            flash.error = g.message(code: "flash.message.file.cannot.previewed")
            println(g.message(code: "flash.message.file.cannot.previewed"))
        }
    }

}
