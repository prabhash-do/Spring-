/**
 * This class is used to access java method to list all files present in remote location
 */
package com.grailsapplication


import com.util.BaseConstants

class ListRemoteFiles {

    static List<String> list() {
        ResourceBundle config = ResourceBundle.getBundle("config")
        List<String> listFiles = new ArrayList<String>();
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
        File folder = new File(destinationPath);

        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
        if (!folderImage.exists()){
            folderImage.mkdir();
        }
        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
        if (!folderPpt.exists()){
            folderPpt.mkdir();
        }
        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
        if (!folderVideo.exists()){
            folderVideo.mkdir();
        }
        File folderDocs = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));
        if (!folderDocs.exists()){
            folderDocs.mkdir();
        }

        File[] files = folder.listFiles();

        for (File file : files) {
            if (file.isFile()) {
                if (!listFiles.contains(file.getName())) {
                    listFiles.add(file.getName())
                }
            }
            else if (file.isDirectory()) {
                //image
                File[] filesImage = folderImage.listFiles();
                for (File fileImage : filesImage) {
                    if (fileImage.isFile()) {
                        if (!listFiles.contains(fileImage.getName())) {
                            listFiles.add(fileImage.getName())
                        }
                    }
                }
                //ppt
                File[] filesPpt = folderPpt.listFiles();
                for (File filePpt : filesPpt) {
                    if (filePpt.isFile()) {
                        if (!listFiles.contains(filePpt.getName())) {
                            listFiles.add(filePpt.getName())
                        }
                    }
                }
                //video
                File[] filesVideo = folderVideo.listFiles();
                for (File fileVideo : filesVideo) {
                    if (fileVideo.isFile()) {
                        if (!listFiles.contains(fileVideo.getName())) {
                            listFiles.add(fileVideo.getName())
                        }
                    }
                }
                //Documents
                File[] filesDocs = folderDocs.listFiles();
                for (File fileDoc : filesDocs) {
                    if (fileDoc.isFile()){
                        if (!listFiles.contains(fileDoc.getName())) {
                            listFiles.add(fileDoc.getName())
                        }
                    }
                }
            }
        }
        return listFiles;
    }
}
