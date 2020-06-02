/**
 * Method doListing() is allowed to List files available in remote location as well as in DataBase
 */
package com.grailsapplication

import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

import javax.naming.directory.SearchResult
import java.util.stream.Collectors

@Secured('permitAll')
class ListingController {

    def doListing() {

        Uploadfile uploadfile = new Uploadfile()
        List<Uploadfile> dbList = uploadfile.list()

        int allCount = dbList.size()
        int docCount = 0
        int imageCount = 0
        int pptCount = 0
        int videoCount = 0

        for (Uploadfile uploadfile1 : dbList) {
            String fileName = uploadfile1.fileName
            String extension = fileName.substring(fileName.lastIndexOf("."))
            if (extension.equalsIgnoreCase(".png") || extension.equalsIgnoreCase(".jpg") || extension.equalsIgnoreCase(".jpeg")) {
                imageCount++
            } else if (extension.equalsIgnoreCase(".ppt") || extension.equalsIgnoreCase(".pptx") || extension.equalsIgnoreCase(".jar")) {
                pptCount++
            } else if (extension.equalsIgnoreCase(".mp4") || extension.equalsIgnoreCase(".mov") || extension.equalsIgnoreCase(".3gp")) {
                videoCount++
            } else if (extension.equalsIgnoreCase(".pdf") || extension.equalsIgnoreCase(".txt") || extension.equalsIgnoreCase(".docx") || extension.equalsIgnoreCase(".xls") || extension.equalsIgnoreCase(".xlsx") || extension.equalsIgnoreCase(".csv")) {
                docCount++
            }
        }
        render view: "/index", model: [dblist: dbList, numberOfAllFiles: allCount, numberOfDocFiles: docCount, numberOfImageFiles: imageCount, numberOfPptFiles: pptCount, numberOfVideoFiles: videoCount]
    }

    def doListingByFileType() {

        Uploadfile uploadfile = new Uploadfile()
        List<Uploadfile> dbListAll = uploadfile.list()
        List<Uploadfile> dbList = new ArrayList<Uploadfile>()
        String fileType = params.fileType

        int allCount = dbListAll.size()
        int docCount = 0
        int imageCount = 0
        int pptCount = 0
        int videoCount = 0

        for (Uploadfile uploadfile1 : dbListAll) {
            String fileName = uploadfile1.fileName
            String extension = fileName.substring(fileName.lastIndexOf("."))
            if (extension.equalsIgnoreCase(".png") || extension.equalsIgnoreCase(".jpg") || extension.equalsIgnoreCase(".jpeg")) {
                imageCount++
                if (fileType == BaseConstants.IMAGES) {
                    dbList.add(uploadfile1)
                }
            } else if (extension.equalsIgnoreCase(".ppt") || extension.equalsIgnoreCase(".pptx") || extension.equalsIgnoreCase(".jar")) {
                pptCount++
                if (fileType == BaseConstants.PPTS) {
                    dbList.add(uploadfile1)
                }
            } else if (extension.equalsIgnoreCase(".mp4") || extension.equalsIgnoreCase(".mov") || extension.equalsIgnoreCase(".3gp")) {
                videoCount++
                if (fileType == BaseConstants.VIDEOS) {
                    dbList.add(uploadfile1)
                }
            } else if (extension.equalsIgnoreCase(".pdf") || extension.equalsIgnoreCase(".txt") || extension.equalsIgnoreCase(".docx") || extension.equalsIgnoreCase(".xls") || extension.equalsIgnoreCase(".xlsx") || extension.equalsIgnoreCase(".csv")) {
                docCount++
                if (fileType == BaseConstants.DOCUMENTS) {
                    dbList.add(uploadfile1)
                }
            }
        }
        render view: "/index", model: [dblist: dbList, numberOfAllFiles: allCount, numberOfDocFiles: docCount, numberOfImageFiles: imageCount, numberOfPptFiles: pptCount, numberOfVideoFiles: videoCount]
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