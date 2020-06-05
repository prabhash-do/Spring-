/**
 * Method doAllDelete() is allowed to delete all files present in remote location
 */
package com.grailsapplication

import com.company.SendMail
import com.company.SendSms
import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteAllController {

    def springSecurityService

    def index() {
        new ListingController().doListing()
    }

    def doMail() {
        User user = springSecurityService.currentUser
        String action = "delete_all"
        SendMail.mail("",user.email,action)
        log.info("Mail has been sent successfully!")
        flash.messageemail = g.message(code: "flash.message.email")
    }

    def doSMS() {
        User user = springSecurityService.currentUser
        String action = "delete_all"
        SendSms.sendsms("",user.mobileNumber,action)
        log.info("SMS has been sent successfully!")
        flash.messagesms = g.message(code: "flash.message.sms")
    }

    def doAllDelete() {

        String destinationPath = BaseHelper.setPath()
        File folder = new File(destinationPath);
        File[] files = folder.listFiles();
        boolean isNotDeleted = false
        CommonUtil.clearBrowserCache(response)
        try {
            if (files.length > 0) {
                for (File file : files) {
                    if (file.isFile()) {
                        if(file.delete()) {
                            deleteFileFromDB(file.name)
                            Settings settings1 = Settings.findByPropertyName("Email_Delete")
                            if (settings1 != null) {
                                if (settings1.propertyValue == "on") {
                                    doMail()
                                }
                            }
                            Settings settings2 = Settings.findByPropertyName("Sms_Delete")
                            if (settings2 != null) {
                                if(settings2.propertyValue=="on"){
                                    doSMS()
                                }
                            }
                        } else {
                            isNotDeleted = true
                        }
                    } else if (file.isDirectory()) {
                        //image
                        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
                        if (folderImage.exists()) {
                            File[] filesImage = folderImage.listFiles();
                            for (File fileImage : filesImage) {
                                if (fileImage.isFile()) {
                                    if(fileImage.delete()) {
                                        deleteFileFromDB(fileImage.name)
                                    } else {
                                        isNotDeleted = true
                                    }
                                }
                            }
                        }
                        //ppt
                        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
                        if (folderPpt.exists()) {
                            File[] filesPpt = folderPpt.listFiles();
                            for (File filePpt : filesPpt) {
                                if (filePpt.isFile()) {
                                    if(filePpt.delete()) {
                                        deleteFileFromDB(filePpt.name)
                                    } else {
                                        isNotDeleted = true
                                    }
                                }
                            }
                        }
                        //video
                        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
                        if (folderVideo.exists()) {
                            File[] filesVideo = folderVideo.listFiles();
                            for (File fileVideo : filesVideo) {
                                if (fileVideo.isFile()) {
                                    if(fileVideo.delete()) {
                                        deleteFileFromDB(fileVideo.name)
                                    } else {
                                        isNotDeleted = true
                                    }
                                }
                            }
                        }
                        //Documents
                        File folderDoc = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));
                        if (folderDoc.exists()) {
                            File[] filesDoc = folderDoc.listFiles();
                            for (File fileDoc : filesDoc) {
                                if (fileDoc.isFile()) {
                                    if(fileDoc.delete()) {
                                        deleteFileFromDB(fileDoc.name)
                                    } else {
                                        isNotDeleted = true
                                    }
                                }
                            }
                        }
                    }
                }
                if (isNotDeleted) {
                    log.info("All files could not be deleted.")
                    response.setHeader("filedelete", "0")
                    render "0"
                    return
                } else {
                    log.info("All files have been deleted Successfully!")
                    response.setHeader("filedelete", "1")
                    render "1"
                    return
                }
            } else {
                log.info("No files found")

            }
        } catch (Exception e) {
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
    }

    def deleteFileFromDB(String fileName) {
        List<String> fileList = BaseHelper.list()
        if (!fileList.contains(fileName)) {
            Uploadfile.executeUpdate("DELETE FROM Uploadfile u WHERE u.fileName = :filename ", [filename: fileName])
            log.info("File " + fileName + " has been deleted successfully!")
        }
    }
}
