/**
 * This class is used to access java method to list all files present in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Decrypt
import com.company.Listfile

import java.nio.file.Path

class ListRemoteFiles {

    static HashMap<String, String> list() {
        ResourceBundle config = ResourceBundle.getBundle("config")
        HashMap<String, String> hmap = new HashMap<Integer, String>();
        String path = new File(".").getCanonicalPath();
        String destinationPath= path + config.getString("destinationPath")
        File folder = new File(destinationPath);

        File folderImage = new File(destinationPath.concat("images\\"));
        if (!folderImage.exists()){
            folderImage.mkdir();
        }
        File folderPpt = new File(destinationPath.concat("ppts\\"));
        if (!folderPpt.exists()){
            folderPpt.mkdir();
        }
        File folderVideo = new File(destinationPath.concat("videos\\"));
        if (!folderVideo.exists()){
            folderVideo.mkdir();
        }

        File[] files = folder.listFiles();

        for (File file : files)
        {
            if (file.isFile())
            {
                URL url = file.toURI().toURL();
                hmap.put(file.getName(), url as String)
            }
            else if (file.isDirectory())
            {
                /*list(file.getAbsolutePath());*/
                //image
                File[] filesImage = folderImage.listFiles();
                for (File fileImage : filesImage) {
                    if (fileImage.isFile()) {
                        URL url = fileImage.toURI().toURL();
                        hmap.put(fileImage.getName(), url as String)
                    }
                }
                //ppt
                File[] filesPpt = folderPpt.listFiles();
                for (File filePpt : filesPpt) {
                    if (filePpt.isFile()) {
                        URL url = filePpt.toURI().toURL();
                        hmap.put(filePpt.getName(), url as String)
                    }
                }
                //video
                File[] filesVideo = folderVideo.listFiles();
                for (File fileVideo : filesVideo) {
                    if (fileVideo.isFile()) {
                        URL url = fileVideo.toURI().toURL();
                        hmap.put(fileVideo.getName(), url as String)
                    }
                }
            }
        }

        return hmap;
        /* ResourceBundle config = ResourceBundle.getBundle("config");

         String userName = config.getString("userName")
         String password = Decrypt.getDecryptedPassword(config.getString("password"))
         String destinationPath = config.getString("destinationPath")


         if (Checkconnetivity.internetConnection()) {
             def files = Listfile.listFileUsingJcifs(userName, password, destinationPath)
             return files
         }else {
             return null
         }*/
    }
}
