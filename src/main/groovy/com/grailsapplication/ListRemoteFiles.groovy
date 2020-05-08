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
        String destinationPath= path+ config.getString("destination")
        File folder = new File(destinationPath);

        File[] files = folder.listFiles();

        for (File file : files)
        {
            if (file.isFile())
            {
                URL url = file.toURI().toURL();
                /*hmap.put("filename",file.getName())
                hmap.put("url",url)*/
                hmap.put(file.getName(), url)
            }
            else if (file.isDirectory())
            {
                list(file.getAbsolutePath());
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
