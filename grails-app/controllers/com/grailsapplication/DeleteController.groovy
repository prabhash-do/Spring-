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
    def index() {
    }

    def doDelete() {

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
                    DeleteAllController deleteAllController = new DeleteAllController();
                    deleteAllController.deleteFileFromDB(fileName)
                    redirect controller: "listing", action: "doListing"
                }
                return true;
            }
        } catch (Exception e) {
            redirect controller: "listing", action: "doListing"
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
    }

}