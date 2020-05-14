package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class SearchController {

    def list(params) {
        def searchName = params.srch
        def filelist = ListRemoteFiles.list()
        if (searchName != null ) {

            if (filelist.contains(searchName)){
                log.info ("file found")
                 def searchList =[searchName]
                log.info (searchList)
                render view: "/listing/list", model:[remotelist: searchList]
            }else{
                flash.error = g.message(code: "flash.message.search.not.found.warn")
                render view: "/listing/list", model:[remotelist:filelist ]
                log.info ("file not found")
            }
        } else {
            flash.warn = g.message(code: "flash.message.file.name.empty.warn")
            log.info ("the file name to search is not specified")
            render view: "/listing/list", model:[remotelist:filelist ]
        }
    }

}