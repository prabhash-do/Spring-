/**
 * This class is used to access java method to list all files present in remote location
 */
package com.grailsapplication
import com.util.BaseConstants

class BaseHelper {

    static List<String> list() {
        List<String> listFiles = new ArrayList<String>();
        String destinationPath = setPath()
        File folder = new File(destinationPath);

        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
        if (!folderImage.exists()) {
            folderImage.mkdir();
        }
        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
        if (!folderPpt.exists()) {
            folderPpt.mkdir();
        }
        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
        if (!folderVideo.exists()) {
            folderVideo.mkdir();
        }
        File folderDocs = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));
        if (!folderDocs.exists()) {
            folderDocs.mkdir();
        }

        File[] files = folder.listFiles();

        for (File file : files) {
            if (file.isFile()) {
                if (!listFiles.contains(file.getName())) {
                    listFiles.add(file.getName())
                }
            } else if (file.isDirectory()) {
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
                    if (fileDoc.isFile()) {
                        if (!listFiles.contains(fileDoc.getName())) {
                            listFiles.add(fileDoc.getName())
                        }
                    }
                }
            }
        }
        return listFiles;
    }

    static String setPath() {
        ResourceBundle config = ResourceBundle.getBundle("config")
        def appHome = System.getProperty("APP_HOME") ?: System.getenv("APP_HOME")
        String destinationPath
        if (appHome) {
            String path = new File(appHome);
            destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH_TOMCAT))
        } else {
            String path = new File(".").getCanonicalPath();
            destinationPath = path.concat(config.getString(BaseConstants.DESTINATION_PATH))
        }
        return destinationPath
    }
    static String setPathForFile(String fileName) {
        String destinationPath = setPath()
        String extension = fileName.substring(fileName.lastIndexOf("."))
        if (extension.equalsIgnoreCase(".png") || extension.equalsIgnoreCase(".jpg") || extension.equalsIgnoreCase(".jpeg")) {
            destinationPath = destinationPath.concat(BaseConstants.IMAGES).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".ppt") || extension.equalsIgnoreCase(".pptx") || extension.equalsIgnoreCase(".jar")) {
            destinationPath = destinationPath.concat(BaseConstants.PPTS).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".mp4") || extension.equalsIgnoreCase(".mov") || extension.equalsIgnoreCase(".3gp")) {
            destinationPath = destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator)
        } else if (extension.equalsIgnoreCase(".pdf") || extension.equalsIgnoreCase(".txt") || extension.equalsIgnoreCase(".docx") || extension.equalsIgnoreCase(".xls") || extension.equalsIgnoreCase(".xlsx") || extension.equalsIgnoreCase(".csv")) {
            destinationPath = destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator)
        }
        return destinationPath
    }

    static List<String> fileListByFileType(String fileType) {
        List<String> listFiles = new ArrayList<String>();
        String destinationPath = setPath()
        File folder = new File(destinationPath);
        File folderImage = new File(destinationPath.concat(BaseConstants.IMAGES).concat(File.separator));
        File folderPpt = new File(destinationPath.concat(BaseConstants.PPTS).concat(File.separator));
        File folderVideo = new File(destinationPath.concat(BaseConstants.VIDEOS).concat(File.separator));
        File folderDocs = new File(destinationPath.concat(BaseConstants.DOCUMENTS).concat(File.separator));

        if (fileType.equals('images')) {
            if (!folderImage.exists()) {
                folderImage.mkdir();
            }
        } else if (fileType.equals('ppts')) {
            if (!folderPpt.exists()) {
                folderPpt.mkdir();
            }
        } else if (fileType.equals('videos')) {

            if (!folderVideo.exists()) {
                folderVideo.mkdir();
            }
        } else if (fileType.equals('documents')) {
            if (!folderDocs.exists()) {
                folderDocs.mkdir();
            }
        }

        File[] files = folder.listFiles();

        for (File file : files) {
            if (file.isFile()) {
                if (!listFiles.contains(file.getName())) {
                    listFiles.add(file.getName())
                }
            } else if (file.isDirectory()) {
                //image
                if (fileType.equals('images')) {
                    File[] filesImage = folderImage.listFiles();
                    for (File fileImage : filesImage) {
                        if (fileImage.isFile()) {
                            if (!listFiles.contains(fileImage.getName())) {
                                listFiles.add(fileImage.getName())
                            }
                        }
                    }
                }
                //ppt
                else if (fileType.equals('ppts')) {
                    File[] filesPpt = folderPpt.listFiles();
                    for (File filePpt : filesPpt) {
                        if (filePpt.isFile()) {
                            if (!listFiles.contains(filePpt.getName())) {
                                listFiles.add(filePpt.getName())
                            }
                        }
                    }
                } else if (fileType.equals('videos')) {
                    //video
                    File[] filesVideo = folderVideo.listFiles();
                    for (File fileVideo : filesVideo) {
                        if (fileVideo.isFile()) {
                            if (!listFiles.contains(fileVideo.getName())) {
                                listFiles.add(fileVideo.getName())
                            }
                        }
                    }
                } else if (fileType.equals('documents')) {
                    //Documents
                    File[] filesDocs = folderDocs.listFiles();
                    for (File fileDoc : filesDocs) {
                        if (fileDoc.isFile()) {
                            if (!listFiles.contains(fileDoc.getName())) {
                                listFiles.add(fileDoc.getName())
                            }
                        }
                    }
                }
            }
        }
        return listFiles;
    }
}
