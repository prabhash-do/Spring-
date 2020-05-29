/**
 * Method doListing() is allowed to List files available in remote location as well as in DataBase
 */
package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

import javax.naming.directory.SearchResult
import java.util.stream.Collectors

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
    def searchList(params) {

        String searchName = params.srch
        List<String> filelist = BaseHelper.list()
        if (searchName.isEmpty()) {
            flash.warn = g.message(code: "flash.message.file.name.empty.warn")
            log.info("the file name to search is not specified")
            render view: "/index", model: [dblist: filelist]
        } else {
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
                filelist.sort()
                List<String> result = filelist
                        .stream()
                        .filter({ x -> x.contains(searchName)})
                        .collect(Collectors.toList());
                Uploadfile uploadfile = new Uploadfile()
                List<Uploadfile> dbList = uploadfile.list()
                List<Uploadfile> searchDbList = new ArrayList<Uploadfile>()
                for (String searchResult: result){
                    for(Uploadfile file : dbList) {
                        if (file.fileName== searchResult){
                            searchDbList.add(file)
                        }
                    }
                }
                log.info("search result is"+ result);
                render view: "/index", model: [dblist: searchDbList]
            } else {
                flash.error = g.message(code: "flash.message.search.not.found.warn")
                render view: "/index", model: [dblist: filelist]
                log.error("file not found")
            }
        }
    }
}