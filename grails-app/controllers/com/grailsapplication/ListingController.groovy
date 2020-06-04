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
        List<Uploadfile> dbListAll = uploadfile.list()

        Object[] fileCount = getFileCount(dbListAll, null)

        render view: "/index", model: [dblist: dbListAll, numberOfAllFiles: fileCount[1], numberOfDocFiles: fileCount[2], numberOfImageFiles: fileCount[3], numberOfPptFiles: fileCount[4], numberOfVideoFiles: fileCount[5]]
    }

    def doListingByFileType() {

        Uploadfile uploadfile = new Uploadfile()
        List<Uploadfile> dbListAll = uploadfile.list()
        String fileType = params.fileType

        Object[] fileCount = getFileCount(dbListAll, fileType)

        render view: "/index", model: [dblist: fileCount[0], numberOfAllFiles: fileCount[1], numberOfDocFiles: fileCount[2], numberOfImageFiles: fileCount[3], numberOfPptFiles: fileCount[4], numberOfVideoFiles: fileCount[5]]
    }

    def searchList(params) {

        Uploadfile uploadfile = new Uploadfile()
        List<Uploadfile> dbListAll = uploadfile.list()
        String searchName = params.srch
        String message
        Object[] fileCount = getFileCount(dbListAll,null)
        try{
            if (searchName.isEmpty()) {
                message = g.message(code: "flash.message.file.search.name.empty.warn")
                log.info("File name to search is not specified")
                chain(action: "doListing", model: [message: message])
            } else {
                List<Uploadfile> searchDbList = new ArrayList<Uploadfile>()
                for(Uploadfile file : dbListAll) {
                    if (file.fileName.toLowerCase().contains(searchName.toLowerCase())) {
                        searchDbList.add(file)
                    }
                }
                if (searchDbList.size()) {
                    log.info("Search result is"+ searchDbList);
                    render view: "/index", model: [dblist: searchDbList, numberOfAllFiles: fileCount[1], numberOfDocFiles: fileCount[2], numberOfImageFiles: fileCount[3], numberOfPptFiles: fileCount[4], numberOfVideoFiles: fileCount[5]]
                } else {
                    log.error("File not found")
                    message = g.message(code: "flash.message.search.not.found.warn")
                    render view: "/index", model: [message: message, numberOfAllFiles: fileCount[1], numberOfDocFiles: fileCount[2], numberOfImageFiles: fileCount[3], numberOfPptFiles: fileCount[4], numberOfVideoFiles: fileCount[5]]
                }
            }
        }catch (Exception) {
            message = g.message(code: "flash.message.unknown.exception")
            render view: "/index", model: [dblist: dbListAll, numberOfAllFiles: fileCount[1], numberOfDocFiles: fileCount[2], numberOfImageFiles: fileCount[3], numberOfPptFiles: fileCount[4], numberOfVideoFiles: fileCount[5]]
        }
    }

    private static Object[] getFileCount(List<Uploadfile> dbListAll, String fileType) {
        List<Uploadfile> dbList = new ArrayList<Uploadfile>()
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
        return [dbList, allCount, docCount, imageCount, pptCount, videoCount]
    }
}