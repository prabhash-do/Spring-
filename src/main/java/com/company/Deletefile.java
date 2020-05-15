package com.company;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;

import static com.company.Accessfile.*;

public class Deletefile {
    private Deletefile() {
    }

    static Logger log = Logger.getLogger(Deletefile.class);

    /**
     * This method takes the filename and delete that file from shared folder
     *
     * @param filename
     * @throws IOException
     */
    public static boolean deleteFileUsingJcifs(String filename) throws IOException {

        String destinationPath = config.getString("url");
        File file = new File(destinationPath + filename);
        try {
            if (!file.exists()) {
                log.warn(message.getString("file.not.found.message"));
                return false;
            } else {
                if (file.delete())
                    log.info(message.getString("success.delete.message"));
                return true;
            }
        } catch (Exception e) {
            log.error("Exception occured while deleting file:\n", e);
        }
        return false;
    }
}
