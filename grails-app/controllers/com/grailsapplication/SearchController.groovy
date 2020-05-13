package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_CLIENT'])
class SearchController {

    def list(params) {
        def searchName = params.srch
        def filelist = ListRemoteFiles.list()
        if (searchName != null ) {

            if (filelist.contains(searchName)){
                println ("file found")
                 def searchList =[searchName]
                println (searchList)
                render view: "/listing/list", model:[remotelist: searchList]
            }else{
                flash.error = g.message(code: "flash.message.search.not.found.warn")
                render view: "/listing/list", model:[remotelist:filelist ]
                println ("file not found")
            }
        } else {
            flash.warn = g.message(code: "flash.message.file.name.empty.warn")
            println ("specify the file name to search")
            render view: "/listing/list", model:[remotelist:filelist ]
        }
    }

}