/**
 * Method doAllDelete() is allowed to delete all files present in remote location
 */
package com.grailsapplication

import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteAllController {

    def index() {
        new ListingController().doListing()
    }

    def doAllDelete() {

        String destinationPath = BaseHelper.setPath()
        File folder = new File(destinationPath);
        File[] files = folder.listFiles();

        try {
            if (files.length > 0) {
                for (File file : files) {
                    if (file.isFile()) {
                        file.delete()
                    } else if (file.isDirectory()) {
                        //image
                        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
                        if (folderImage.exists()) {
                            File[] filesImage = folderImage.listFiles();
                            for (File fileImage : filesImage) {
                                if (fileImage.isFile()) {
                                    fileImage.delete()
                                }
                            }
                        }
                        //ppt
                        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
                        if (folderPpt.exists()) {
                            File[] filesPpt = folderPpt.listFiles();
                            for (File filePpt : filesPpt) {
                                if (filePpt.isFile()) {
                                    filePpt.delete()
                                }
                            }
                        }
                        //video
                        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
                        if (folderVideo.exists()) {
                            File[] filesVideo = folderVideo.listFiles();
                            for (File fileVideo : filesVideo) {
                                if (fileVideo.isFile()) {
                                    fileVideo.delete()
                                }
                            }
                        }
                        //Documents
                        File folderDoc = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));
                        if (folderDoc.exists()) {
                            File[] filesDoc = folderDoc.listFiles();
                            for (File fileDoc : filesDoc) {
                                if (fileDoc.isFile()) {
                                    fileDoc.delete()
                                }
                            }
                        }
                    }
                }
                Uploadfile.executeUpdate("DELETE FROM Uploadfile")
                redirect view: "index"
                log.info("All files have been deleted Successfully!")
            } else {
                redirect view: "index"
                log.info("No files found")
            }
        } catch (Exception e) {
            redirect view: "index"
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
    }
}
