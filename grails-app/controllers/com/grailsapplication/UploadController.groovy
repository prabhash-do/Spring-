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
import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class UploadController {


    def index() {
        render view: '../index'
    }

    def doMail(def fileName) {
//        ResourceBundle message = ResourceBundle.getBundle("messages");
        Sendmail.mail(fileName)
        log.info("Mail has been sent successfully!")
        flash.messageemail = message.getString("flash.message.email")
    }

    def doSMS(def fileName) {
//        ResourceBundle message = ResourceBundle.getBundle("messages");
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

    def doUpload() {
        ResourceBundle config = ResourceBundle.getBundle("config")
        try {
            def file = request.getFile('file')
            String fileName = file.originalFilename
            def appHome = System.getProperty("APP_HOME") ?: System.getenv("APP_HOME")
            String destinationPath
            if (appHome) {
                String path = new File(appHome);
                destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH_TOMCAT))
            }
            else {
                String path = new File(".").getCanonicalPath();
                destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH))
            }
            String extension = fileName.substring(fileName.lastIndexOf("."))
            if (extension.equalsIgnoreCase(".png")||extension.equalsIgnoreCase(".jpg")||extension.equalsIgnoreCase(".jpeg")) {
                destinationPath = destinationPath.concat(BaseConstants.IMAGES).concat(File.separator)
            }
            else if (extension.equalsIgnoreCase(".ppt")||extension.equalsIgnoreCase(".pptx")||extension.equalsIgnoreCase(".jar")) {
                destinationPath = destinationPath.concat(BaseConstants.PPTS).concat(File.separator)
            }
            else if (extension.equalsIgnoreCase(".mp4")||extension.equalsIgnoreCase(".mov")||extension.equalsIgnoreCase(".3gp")) {
                destinationPath = destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator)
            }
            else if (extension.equalsIgnoreCase(".pdf")||extension.equalsIgnoreCase(".txt")||extension.equalsIgnoreCase(".docx")||extension.equalsIgnoreCase(".xls")||extension.equalsIgnoreCase(".xlsx")||extension.equalsIgnoreCase(".csv")) {
                destinationPath = destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator)
            }
            def files = ListRemoteFiles.list()
            File fileDest = new File(destinationPath.concat(fileName))
            file.transferTo(fileDest)

            /*File fileDelete = new File(destinationPath);
            FileDeleteStrategy.FORCE.delete(fileDelete);

            def files = ListRemoteFiles.list()
            File fileDest = new File(destinationPath)
            boolean isCreated = fileDest.createNewFile()

            if (!file.isEmpty() && isCreated) {
                file.transferTo(fileDest);
            }
            fileDest.setWritable(true);*/

            if (Checkconnetivity.internetConnection()) {
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
