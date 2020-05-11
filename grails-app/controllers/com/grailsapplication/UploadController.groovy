/**
 * Method  doUpload() is allowed to upload a file in remote location as well as in Database
 * Note: The file will be in .pdf, .csv, .xlsx, .xml, .txt Format only !
 * Method doMail() is allowed to send an email while uploading file in remote location
 * Method doSMS() is allowed to send SMS while uploading file in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Checkcopyfile
import com.company.Decrypt
import com.company.Sendmail
import com.company.Sendsms
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_CLIENT'])
class UploadController {


    def index() {
        render view: '../index'
    }

    def doMail(def fileName) {
        ResourceBundle message = ResourceBundle.getBundle("messages");
        Sendmail.mail(fileName)
        log.info("Mail has been sent successfully!")
        flash.messageemail = message.getString("flash.message.email")
    }

    def doSMS(def fileName) {
        ResourceBundle message = ResourceBundle.getBundle("messages");
        Sendsms.sendsms(fileName)
        log.info("SMS has been sent successfully!")
        flash.messagesms = message.getString("flash.message.sms")
    }

    def doDataBaseEntry(fileName) {
        ResourceBundle message = ResourceBundle.getBundle("messages");
        Uploadfile uploadfile = new Uploadfile()
        uploadfile.fileName = fileName
        uploadfile.status = true
        uploadfile.insert(flush: true)
        log.info("File " + fileName + " has been inserted into DataBase successfully!")
    }

    def doUpload = {
        ResourceBundle config = ResourceBundle.getBundle("config")
        try {
            def userName = config.getString("userName")
            def password = Decrypt.getDecryptedPassword(config.getString("password"))

            def file = request.getFile('file')
            String fileName = file.originalFilename
            String path = new File(".").getCanonicalPath();
            def destinationPath = path + config.getString("destinationPath")
            def extension = fileName.substring(fileName.lastIndexOf("."))
            if (extension.equalsIgnoreCase(".png")||extension.equalsIgnoreCase("jpg")||extension.equalsIgnoreCase("jpeg")) {
                destinationPath = destinationPath.concat("images\\")
            }
            else if (extension.equalsIgnoreCase(".pptx")||extension.equalsIgnoreCase(".pdf")||extension.equalsIgnoreCase(".jar")) {
                destinationPath = destinationPath.concat("ppts\\")
            }
            else if (extension.equalsIgnoreCase(".mp4")||extension.equalsIgnoreCase(".mov")||extension.equalsIgnoreCase(".3gp")) {
                destinationPath = destinationPath.concat("videos\\")
            }
            def files = ListRemoteFiles.list()
            File fileDest = new File(destinationPath + fileName)
            file.transferTo(fileDest)

            if (Checkconnetivity.internetConnection()) {
                if (!files.containsKey(fileName)) {
                    log.info("File " + fileName + " has been uploaded successfully!")
                    flash.message = g.message(code: "flash.message.file.upload")
                } else {
                    log.warn("File is already there in remote location ")
                    flash.message = g.message(code: "flash.message.replace.file")
                }

                doDataBaseEntry(fileName)

                boolean isemailchecked = params.email
                if (isemailchecked) {
                    doMail(fileName)
                }
                boolean issmschecked = params.sms
                if (issmschecked) {
                    //doSMS(fileName)
                }

            } else {
                flash.error = g.message(code: "flash.message.check.connectivity")
            }
        } catch (Exception e) {
            log.error("Exception occured while Uploading file:\n", e)
        }
        redirect view: "index"
    }

    /*def doUpload = {
        ResourceBundle config = ResourceBundle.getBundle("config")
        try {
            def userName = config.getString("userName")
            def password = Decrypt.getDecryptedPassword(config.getString("password"))
            def destinationPath = config.getString("destinationPath")
            def path = g.message(code: "default.path")
            def file = request.getFile('file')
            String fileName = file.originalFilename
            def sourcePath = path.concat(fileName)

            File fileDest = new File(path + fileName)
            file.transferTo(fileDest)

            if (Checkconnetivity.internetConnection()) {

                def files = ListRemoteFiles.list()
                def insertFile = Checkcopyfile.copyFile(userName, password, destinationPath, sourcePath, fileName)
                if (insertFile) {

                    if (!files.contains(fileName)) {
                        log.info("File " + fileName + " has been uploaded successfully!")
                        flash.message = g.message(code: "flash.message.file.upload")
                    } else {
                        log.warn("File is already there in remote location ")
                        flash.message = g.message(code: "flash.message.replace.file")
                    }

                    doDataBaseEntry(fileName)

                    boolean isemailchecked = params.email
                    if (isemailchecked) {
                        doMail(fileName)
                    }
                    boolean issmschecked = params.sms
                    if (issmschecked) {
                        //doSMS(fileName)
                    }
                } else {
                    flash.warn = g.message(code: "flash.message.invalid.file")
                    log.warn("Invalid File size or check file format . file will be in .pdf, .csv, .xlsx, .xml, .txt Format only !")
                }

            } else {
                flash.error = g.message(code: "flash.message.check.connectivity")
            }
        } catch (Exception e) {
            log.error("Exception occured while Uploading file:\n", e)
        }
        redirect view: "index"
    }*/

}
