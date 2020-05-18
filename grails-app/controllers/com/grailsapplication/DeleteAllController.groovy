/**
 * Method doAllDelete() is allowed to delete all files present in remote location
 */
package com.grailsapplication


import com.util.BaseConstants
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteAllController {


    def index() {
        render view: '../index'
    }

    def doAllDelete() {

        String destinationPath = LoginController.setPath()
        File folder = new File(destinationPath);
        File[] files = folder.listFiles();

        try {
            if (files.length > 0) {
                for (File file : files) {
                    if (file.isFile()) {
                        file.delete();
                    } else if (file.isDirectory()) {
                        //image
                        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
                        if (folderImage.exists()) {
                            File[] filesImage = folderImage.listFiles();
                            for (File fileImage : filesImage) {
                                if (fileImage.isFile()) {
                                    fileImage.delete();
                                }
                            }
                        }
                        //ppt
                        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
                        if (folderPpt.exists()) {
                            File[] filesPpt = folderPpt.listFiles();
                            for (File filePpt : filesPpt) {
                                if (filePpt.isFile()) {
                                    filePpt.delete();
                                }
                            }
                        }
                        //video
                        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
                        if (folderVideo.exists()) {
                            File[] filesVideo = folderVideo.listFiles();
                            for (File fileVideo : filesVideo) {
                                if (fileVideo.isFile()) {
                                    fileVideo.delete();
                                }
                            }
                        }
                        //Documents
                        File folderDoc = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));
                        if (folderDoc.exists()) {
                            File[] filesDoc = folderDoc.listFiles();
                            for (File fileDoc : filesDoc) {
                                if (fileDoc.isFile()) {
                                    fileDoc.delete();
                                }
                            }
                        }
                    }
                }
                redirect view: "index"
                log.info("All files are deleted successfully!")
                flash.message = g.message(code: "flash.message.all.files.delete")
            } else {
                redirect view: "index"
                log.info("No files found")
                flash.warn = g.message(code: "flash.message.no.files.found")
            }
        } catch (Exception e) {
            redirect view: "index"
            log.error("Exception occurred while deleting file:\n", e);
            return false;
        }
        /*if (CheckConnetivity.internetConnection()) {
            def delete = DeleteAllFile.deleteAllFileUsingJcifs()
            if (delete) {
                int length = DeleteAllFile.length
                log.info(length + "files from Remote Location are deleted successfully!")
                redirect view: "index"
                flash.message = length + " " + g.message(code: "flash.message.all.files.delete")
            } else {
                log.info("No files found in Remote Location")
                redirect view: "index"
                flash.warn = g.message(code: "flash.message.no.files.found")
            }
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            redirect view: "index"
        }*/
    }
}
