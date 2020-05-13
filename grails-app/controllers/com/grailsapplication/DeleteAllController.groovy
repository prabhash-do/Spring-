/**
 * Method doAllDelete() is allowed to delete all files present in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Deleteallfile
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteAllController {


    def index() {
        render view: '../index'
    }

    def doAllDelete = {

        if (Checkconnetivity.internetConnection()) {
            def delete = Deleteallfile.deleteAllFileUsingJcifs()
            if (delete) {
                int length = Deleteallfile.length
                log.info(length + "files from Remote Location are deleted successfully!")
                redirect view: "index"
                flash.message = length + " " + g.message(code: "flash.message.all.files.delete")
            } else {
                log.info("No files found in Remote Location")
                redirect view: "index"
                flash.warn = g.message(code: "flash.message.no.files.found")
            }
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            redirect view: "index"
        }
    }
}
