/**
 * Method  doUpload() is allowed to upload a file in remote location as well as in Database
 * Note: The file will be in .pdf, .csv, .xlsx, .xml, .txt Format only !
 * Method doMail() is allowed to send an email while uploading file in remote location
 * Method doSMS() is allowed to send SMS while uploading file in remote location
 */
package com.grailsapplication

import com.company.CheckConnectivity
import com.company.SendMail
import com.company.SendSms
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class UploadController {


    def index() {
        render view: '../index'
    }

    def doMail(def fileName) {

        SendMail.mail(fileName)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMS(def fileName) {

        SendSms.sendsms(fileName)
        log.info("SMS has been sent successfully!")
        flash.messagesms = g.message(code: "flash.message.sms")
    }

    def doDataBaseEntry(fileName, fileSize) {

        String date = new Date().format("dd/MM/yyyy hh:mm:ss a")

        Uploadfile uploadfile = new Uploadfile()
        uploadfile.fileName = fileName
        uploadfile.fileSize = fileSize
        uploadfile.creationDate = date
        uploadfile.status = true
        uploadfile.insert(flush: true)
        log.info("File " + fileName + " has been inserted into DataBase successfully!")
    }

    def doUpload() {
        try {
            def file = request.getFile('file')
            String fileName = file.originalFilename
            Uploadfile uploadfile = new Uploadfile()
            List<Uploadfile> dbList = uploadfile.list()
            List<String> localList = BaseHelper.list()

            /*Check and upload to local*/
            if (!localList.contains(fileName)) {
                String destinationPath = BaseHelper.setPathForFile(fileName)
                File fileDest = new File(destinationPath.concat(fileName))
                file.transferTo(fileDest)
            }

            /*Check and upload to database*/
            boolean isPresent = false
            for (Uploadfile uploadfile1: dbList) {
                if (uploadfile1.fileName == fileName) {
                    isPresent = true
                    break
                }
            }
            if (!isPresent) {
                String fileSize = getFileSize((Long)file.size)
                doDataBaseEntry(fileName, fileSize)
                log.info("File " + fileName + " has been uploaded successfully!")
                flash.message = g.message(code: "flash.message.file.upload")
            } else {
                log.warn("File is already there")
                flash.message = g.message(code: "flash.message.replace.file")
            }

            /*DON'T DELETE*/
            /*if (CheckConnectivity.internetConnection()) {
                boolean isemailchecked = params.email
                if (isemailchecked) {
                    doMail(fileName)
                }
                boolean issmschecked = params.sms
                if (issmschecked) {
                    doSMS(fileName)
                }
            } else {
                flash.error = g.message(code: "flash.message.check.connectivity")
            }*/
        } catch (Exception e) {
            log.error("Exception occured while Uploading file:\n", e)
        }
        new ListingController().doListing()
    }

    private static String getFileSize(Long fileSize) {
        if (fileSize < 1024) {
            return ((double) fileSize).round(2) + " Bytes";
        } else if (fileSize < 1024 * 1024) {
            return ((double) fileSize / 1024).round(2) + " KB";
        } else if (fileSize < 1024 * 1024 * 1024) {
            return ((double) fileSize / (1024 * 1024)).round(2) + " MB";
        } else {
            return ((double) fileSize / (1024 * 1024 * 1024)).round(2) + " GB";
        }
    }
}
