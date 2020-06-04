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
import org.hibernate.validator.constraints.Email

@Secured(['permitAll'])
class UploadController {
    def springSecurityService

    def index() {
        render view: '../index'
    }

    def doMail(def fileName) {
        User user = springSecurityService.currentUser
        String action = "upload"
        SendMail.mail(fileName,user.email,action)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMS(def fileName) {
        User user = springSecurityService.currentUser
        String action = "upload"
        SendSms.sendsms(fileName,user.mobileNumber,action)
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
        String message;
        Settings settings = Settings.findByPropertyName("File size")
        Double fileSize1 = settings.propertyValue.toDouble()
        try {
            def file = request.getFile('file')
            String fileName = file.originalFilename
            Uploadfile uploadfile = new Uploadfile()
            List<Uploadfile> dbList = uploadfile.list()
            List<String> localList = BaseHelper.list()
            Double fSize = file.size / (1024 * 1024)
            if (fSize >= settings.propertyValue.toDouble()) {
                log.warn("File Size is more than the accepted value")
            } else {
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
                    message = g.message(code: "flash.message.file.upload" ,args:[fileName])
                } else {
                    log.warn("File is already there")
                    message = g.message(code: "flash.message.replace.file")
                }
            }

            Settings settings1 = Settings.findByPropertyName("Email_Upload")
            if (settings1 != null) {
                if(settings1.propertyValue=="on"){
                    doMail(fileName)
                }
            }

            Settings settings2 = Settings.findByPropertyName("Sms_Upload")
            if (settings2 != null) {
                if(settings2.propertyValue=="on"){
                    doSMS(fileName)
                }
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
        render view: "/insert/upload", model: [message: message, fileSize1: fileSize1]
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
