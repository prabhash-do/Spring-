package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

import java.util.stream.Collectors

@Secured(['ROLE_CLIENT'])
class SearchController {

    def list(params) {

        String searchName = params.srch
        List<String> filelist = ListRemoteFiles.list()
        if (searchName.isEmpty()) {
            flash.warn = g.message(code: "flash.message.file.name.empty.warn")
            log.info("the file name to search is not specified")
            render view: "/listing/list", model: [remotelist: filelist]
        } else if (!searchName.isEmpty()) {
            if (filelist.containsAll(searchName)) {
                /*{ it ->
                def fileExt = it.substring(it.lastIndexOf("."));

               def fileName = it.replace(fileExt, '')
               def searching=searchName.replace(searchExt, '')
               if(searchExt==null||searchExt==fileExt){
                   if (fileName.equalsIgnoreCase(searching)) {
               filelist.findAll().add(searchName)
               log.info("file found")
               def searchedList = [filelist.findAll().add(searchName)]
               log.info(searchedList)
               render view: "/listing/list", model: [remotelist: searchedList]
*/

                List<String> result = filelist
                        .stream()
                        .filter({ x -> x.contains(searchName)})
                        .collect(Collectors.toList());
                log.info(result);
                render view: "/listing/list", model: [remotelist: result]

            } else {
                flash.error = g.message(code: "flash.message.search.not.found.warn")
                render view: "/listing/list", model: [remotelist: filelist]
                log.error("file not found")
            }

        }
    }
}

