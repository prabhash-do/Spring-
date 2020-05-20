/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import com.company.CheckConnectivity
import com.company.DeleteFile
import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def springSecurityService

    def index() {
    }

    def doDelete () {

        String fileName = params.filename
        String destinationPath = LoginController.setPathForFile(fileName)
        File file = new File(destinationPath.concat(fileName));

        try {
            if (!file.exists()) {
                redirect controller: "listing", action: "doListing"
                log.info("File " + fileName + " not found!")
                flash.message = g.message(code: "file.not.found.message")
                return false;
            } else {
                if (file.delete()) {
                    deleteFileFromDB(fileName)
                }
                return true;
            }
        } catch (Exception e) {
            redirect controller: "listing", action: "doListing"
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
    }

    def deleteFileFromDB(String fileName) {
        List<String> fileList = ListRemoteFiles.list()
        if (!fileList.contains(fileName)) {
            Uploadfile.executeUpdate("DELETE FROM Uploadfile u WHERE u.fileName = :filename ", [filename: fileName])
            redirect controller: "listing", action: "doListing"
            log.info("File " + fileName + " has been deleted successfully!")
            flash.message = g.message(code: "success.delete.message")
        }
    }
}