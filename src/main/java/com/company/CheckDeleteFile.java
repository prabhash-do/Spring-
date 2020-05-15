package com.company;

import org.apache.log4j.Logger;
import java.io.IOException;
import static com.company.AccessFile.*;

public class CheckDeleteFile {

    static Logger log = Logger.getLogger(CheckDeleteFile.class);

    private CheckDeleteFile() {
    }

    /**
     * Delete files present in shared location
     *
     * @param filename
     * @throws IOException
     * @Command java -jar <jarname.jar> -d <filename>   Delete a specific file
     * @Command java -jar <jarname.jar> -d "*"          Delete all files
     */
    public static void deleteFile(String filename) throws IOException {

        if (!filename.equals("*")) {
            if (!filename.toLowerCase().endsWith(".pdf") && !filename.toLowerCase().endsWith(".xml") && !filename.toLowerCase().endsWith(".xlsx") && !filename.toLowerCase().endsWith(".csv") && !filename.toLowerCase().endsWith(".txt")) {
                log.info(message.getString("invalid.message"));
            } else {
                DeleteFile.deleteFileUsingJcifs(filename);
            }
        } else {
            DeleteAllFile.deleteAllFileUsingJcifs();
        }

    }
}
