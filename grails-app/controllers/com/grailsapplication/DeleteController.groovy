/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def index() {
    }

    def doDelete() {

        String fileName = params.filename
        String destinationPath = BaseHelper.setPathForFile(fileName)

        File file = new File(destinationPath.concat(fileName));

        try {
            if (!file.exists()) {
                redirect controller: "listing", action: "doListing"
                log.info("File " + fileName + " not found!")
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
        List<String> fileList = BaseHelper.list()
        if (!fileList.contains(fileName)) {
            Uploadfile.executeUpdate("DELETE FROM Uploadfile u WHERE u.fileName = :filename ", [filename: fileName])
            redirect controller: "listing", action: "doListing"
            log.info("File " + fileName + " has been deleted successfully!")
        }
    }
}