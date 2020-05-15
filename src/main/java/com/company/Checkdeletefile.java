package com.company;

import org.apache.log4j.Logger;
import java.io.IOException;
import static com.company.Accessfile.*;

public class Checkdeletefile {

    static Logger log = Logger.getLogger(Checkdeletefile.class);

    private Checkdeletefile() {
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
                Deletefile.deleteFileUsingJcifs(filename);
            }
        } else {
            Deleteallfile.deleteAllFileUsingJcifs();
        }

    }
}
