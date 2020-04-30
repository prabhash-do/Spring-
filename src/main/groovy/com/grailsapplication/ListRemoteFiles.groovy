/**
 * This class is used to access java method to list all files present in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Decrypt
import com.company.Listfile

class ListRemoteFiles {
    static List<String> list() {

        ResourceBundle config = ResourceBundle.getBundle("config");

        String userName = config.getString("userName")
        String password = Decrypt.getDecryptedPassword(config.getString("password"))
        String destinationPath = config.getString("destinationPath")


        if (Checkconnetivity.internetConnection()) {
            def files = Listfile.listFileUsingJcifs(userName, password, destinationPath)
            return files
        }else {
            return null
        }
    }
}
