/**
 * Method  doUpload() is allowed to upload a file in remote location as well as in Database
 * Note: The file will be in .pdf, .csv, .xlsx, .xml, .txt Format only !
 * Method doMail() is allowed to send an email while uploading file in remote location
 * Method doSMS() is allowed to send SMS while uploading file in remote location
 */
package com.grailsapplication

import com.company.CheckConnectivity
import com.company.SendMail

import com.util.BaseConstants
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

        Sendsms.sendsms(fileName)
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
            String destinationPath = BaseHelper.setPathForFile(fileName)

            def files = BaseHelper.list()
            File fileDest = new File(destinationPath.concat(fileName))
            file.transferTo(fileDest)

            if (CheckConnectivity.internetConnection()) {
                if (!files.contains(fileName)) {
                    def remotelist = ListRemoteFiles.list()
                    if (remotelist != null) {
                        if (remotelist.isEmpty()) {
                            flash._warn = g.message(code: "flash.message.no.files.found")
                            log.info("No files found in Remote location")
                        } else {
                            log.info("Files in Remote location are listed")
                        }
                        render view: "/index", model: [remotelist: remotelist]
                    } else {
                        flash.error = g.message(code: "flash.message.check.connectivity")
                    }
                    log.info("File " + fileName + " has been uploaded successfully!")
                    flash.message = g.message(code: "flash.message.file.upload")
                } else {
                    log.warn("File is already there in remote location ")
                    flash.message = g.message(code: "flash.message.replace.file")
                }

                doDataBaseEntry(fileName, file.size)

                /*boolean isemailchecked = params.email
                if (isemailchecked) {
                    doMail(fileName)
                }
                boolean issmschecked = params.sms
                if (issmschecked) {
                    doSMS(fileName)
                }*/

            } else {
                flash.error = g.message(code: "flash.message.check.connectivity")
            }
        } catch (Exception e) {
            log.error("Exception occured while Uploading file:\n", e)
        }
        new ListingController().doListing()
    }

}
