/**
 * Method doListing() is allowed to List files available in remote location as well as in DataBase
 */
package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ListingController {


    def doListing(){

        Uploadfile uploadfile = new Uploadfile()
        def dblist = uploadfile.list()
        def remotelist = ListRemoteFiles.list()
        if (remotelist != null) {
            if (dblist.isEmpty()) {
                flash.warn = g.message(code: "flash.message.db.warn")
                log.info("No files found in DataBase Table: 'Uploadfile'")
            } else {
                log.info("Files in DataBase are listed")
            }
            if (remotelist.isEmpty()) {
                flash._warn = g.message(code: "flash.message.remote.warn")
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

