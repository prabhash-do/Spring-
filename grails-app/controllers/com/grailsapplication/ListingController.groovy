/**
 * Method doListing() is allowed to List files available in remote location as well as in DataBase
 */
package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ListingController {


    def doListing() {

        Uploadfile uploadfile = new Uploadfile()
        def dblist = uploadfile.list()
        def remotelist = BaseHelper.list()
        if (remotelist != null) {
            if (remotelist.isEmpty()) {
                flash._warn = g.message(code: "flash.message.no.files.found")
                log.info("No files found in Remote location")
            } else {
                log.info("Files in Remote location are listed")
            }
            render view: "list", model: [remotelist: remotelist, dblist: dblist]
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            render view: "list", model: [dblist: dblist]
        }
    }

    def doListingByFileType() {

        Uploadfile uploadfile = new Uploadfile()
        String fileType = params.fileType
        def dblist = uploadfile.list()
        def remotelist = BaseHelper.fileListByFileType(fileType)
        if (remotelist != null) {
            if (remotelist.isEmpty()) {
                flash._warn = g.message(code: "flash.message.no.files.found")
                log.info("No files found in Remote location")
            } else {
                log.info("Files in Remote location are listed")
            }
            render view: "list", model: [remotelist: remotelist, dblist: dblist]
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            render view: "list", model: [dblist: dblist]
        }
    }
}

