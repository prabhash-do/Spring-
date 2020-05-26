/**
 * Method doListing() is allowed to List files available in remote location as well as in DataBase
 */
package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ListingController {


    def doListing() {

        Uploadfile uploadfile = new Uploadfile()
        List<Uploadfile> dbList = uploadfile.list()
        List<String> remoteList = BaseHelper.list()
        if (remoteList != null) {
            if (remoteList.isEmpty()) {
                log.info("No files found")
            } else {
                log.info("Files are listed")
            }
            render view: "/index", model: [remotelist: remoteList, dblist: dbList]
        } else {
            render view: "/index", model: [dblist: dbList]
        }
    }

    def doListingByFileType() {

        Uploadfile uploadfile = new Uploadfile()
        String fileType = params.fileType

        List<Uploadfile> dbListAll = uploadfile.list()
        List<Uploadfile> dbList = new ArrayList<Uploadfile>()
        List<String> remoteList = BaseHelper.fileListByFileType(fileType)
        for (String remoteFile: remoteList) {
            for (Uploadfile dbFile: dbListAll) {
                if (remoteFile == dbFile.fileName) {
                    dbList.add(dbFile)
                }
            }
        }

        if (remoteList != null) {
            if (remoteList.isEmpty()) {
                log.info("No files found")
            } else {
                log.info("Files are listed")
            }
            render view: "/index", model: [remotelist: remoteList, dblist: dbList]
        } else {
            render view: "/index", model: [dblist: dbList]
        }
    }
}

