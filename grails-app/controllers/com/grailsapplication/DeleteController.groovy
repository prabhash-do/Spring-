/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import com.company.SendMail
import com.company.SendSms
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def springSecurityService

    def index() {
    }

    def doMail(def fileName) {
        User user = springSecurityService.currentUser
        String action = "delete"
        SendMail.mail(fileName,user.email,action)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMS(def fileName) {
        User user = springSecurityService.currentUser
        String action = "delete"
        SendSms.sendsms(fileName,user.mobileNumber,action)
        log.info("SMS has been sent successfully!")
        flash.messagesms = g.message(code: "flash.message.sms")
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

                    Settings settings1 = Settings.findByPropertyName("Email_Delete")
                    if (settings1 != null) {
                        if (settings1.propertyValue == "on") {
                            doMail(fileName)
                        }
                    }

                    Settings settings2 = Settings.findByPropertyName("Sms_Delete")
                    if (settings2 != null) {
                        if(settings2.propertyValue=="on"){
                            doSMS(fileName)
                        }
                    }

                    return true;
                }
                else {
                    return false;
                }
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