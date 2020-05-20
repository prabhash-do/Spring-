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

    def doDataBaseEntry(fileName) {

        Uploadfile uploadfile = new Uploadfile()
        uploadfile.fileName = fileName
        uploadfile.status = true
        uploadfile.insert(flush: true)
        log.info("File " + fileName + " has been inserted into DataBase successfully!")
    }

    def doUpload() {
        try {
            def file = request.getFile('file')
            String fileName = file.originalFilename
            String destinationPath = BaseHelper.setPath()
            def extension = fileName.substring(fileName.lastIndexOf("."))
            if (extension.equalsIgnoreCase(".png") || extension.equalsIgnoreCase(".jpg") || extension.equalsIgnoreCase(".jpeg")) {
                destinationPath = destinationPath.concat(BaseConstants.IMAGES).concat(File.separator)
            } else if (extension.equalsIgnoreCase(".ppt") || extension.equalsIgnoreCase(".pptx") || extension.equalsIgnoreCase(".jar")) {
                destinationPath = destinationPath.concat(BaseConstants.PPTS).concat(File.separator)
            } else if (extension.equalsIgnoreCase(".mp4") || extension.equalsIgnoreCase(".mov") || extension.equalsIgnoreCase(".3gp")) {
                destinationPath = destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator)
            } else if (extension.equalsIgnoreCase(".pdf") || extension.equalsIgnoreCase(".txt")) {
                destinationPath = destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator)
            }
            def files = BaseHelper.list()
            File fileDest = new File(destinationPath.concat(fileName))
            file.transferTo(fileDest)

            if (CheckConnectivity.internetConnection()) {
                if (!files.contains(fileName)) {
                    log.info("File " + fileName + " has been uploaded successfully!")
                    flash.message = g.message(code: "flash.message.file.upload")
                } else {
                    log.warn("File is already there in remote location ")
                    flash.message = g.message(code: "flash.message.replace.file")
                }

                doDataBaseEntry(fileName)

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
        redirect view: "index"
    }

}
