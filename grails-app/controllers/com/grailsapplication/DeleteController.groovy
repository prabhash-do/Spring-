/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Deletefile
import com.util.BaseConstants
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def springSecurityService

    def index() {
    }

    def doDelete() {

        ResourceBundle config = ResourceBundle.getBundle("config")
        String path = new File(".").getCanonicalPath();
        String destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH))
        String fileName = params.filename
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

    def userdelete = {

        User user = User.findById(params.userid)
        BootStrap.userRoleService.delete(user)
        user.delete(flush: true)
        flash.successmessage = user.username + " " + g.message(code: "flash.message.user.delete")
        redirect controller: "userManagement", action: "index"

    }
}