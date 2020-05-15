/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import com.company.CheckConnectivity
import com.company.DeleteFile
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def springSecurityService

    def index() {
    }

    def doDelete() {

        ResourceBundle config = ResourceBundle.getBundle("config")
        String fileName = params.filename
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

        def filename = params.filename
        if (CheckConnectivity.internetConnection()) {
            if (DeleteFile.deleteFileUsingJcifs(filename)) {
                log.info("File has been deleted successfully from Remote Location!")
                flash.message = g.message(code: "flash.message.file.delete")
                redirect controller: "listing", action: "doListing"
            }
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            redirect controller: "listing", action: "doListing"
        }
        File file = new File(destinationPath.concat(fileName));

        try {
            if (!file.exists()) {
                redirect controller: "listing", action: "doListing"
                log.info("File " + fileName + " not found!")
                flash.message = g.message(code: "file.not.found.message")
                return false;
            } else {
                if (file.delete()) {
                    redirect controller: "listing", action: "doListing"
                    log.info("File " + fileName + " has been deleted successfully!")
                    flash.message = g.message(code: "success.delete.message")
                }
                return true;
            }
        } catch (Exception e) {
            redirect controller: "listing", action: "doListing"
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
    }

    def userdelete(){

        User user = User.findById(params.userid)
        BootStrap.userRoleService.delete(user)
        user.delete(flush: true)
        flash.successmessage = user.username + " " + g.message(code: "flash.message.user.delete")
        redirect controller: "userManagement", action: "index"

    }
}