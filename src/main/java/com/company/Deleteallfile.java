package com.company;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;

import static com.company.Accessfile.*;

public class Deleteallfile {

    public static int length;

    private Deleteallfile() {
    }

    static Logger log = Logger.getLogger(Deleteallfile.class);

    /**
     * This method deletes all files,if available, from shared folder
     *
     * @throws IOException
     */
    public static boolean deleteAllFileUsingJcifs() throws IOException {

        String destinationPath = config.getString("url");

        File f = new File(destinationPath);
        try {
            if (f.exists()) {
                File[] files = f.listFiles();
                length = files.length;
                if (length > 0) {
                    for (File file : f.listFiles())
                        if (file.isDirectory() == false) {
                            file.delete();
                        }
                    log.info(message.getString("success.delete.all.files"));
                    return true;
                } else {
                    log.warn(message.getString("files.not.found"));
                    return false;
                }
            }
        } catch (Exception e) {
            log.error("Exception occured while deleting all files:\n", e);
        }
        return false;
    }
}


