package com.company;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static com.company.AccessFile.message;

public class CheckCopyFile {

    static Logger log = Logger.getLogger(CheckCopyFile.class);
    private CheckCopyFile() {
    }

    /**
     * copy File in shared location
     *
     * @param userName
     * @param password
     * @param destinationPath
     * @param sourcePath
     * @throws IOException
     * @Command java -jar <jarname.jar> -f <filename>
     */
    public static boolean copyFile(String userName, String password, String destinationPath, String sourcePath, String filename) throws IOException {

        long size = (1024 * 1024) * 10; //size=10MB
        long filesize = Files.size(Paths.get(sourcePath));
        boolean flag = false;
        if (!sourcePath.toLowerCase().endsWith(".pdf") && !sourcePath.toLowerCase().endsWith(".xml") && !sourcePath.toLowerCase().endsWith(".xlsx") && !sourcePath.toLowerCase().endsWith(".csv") && !sourcePath.toLowerCase().endsWith(".txt")) {
            log.info(message.getString("invalid.message"));
            return flag;
        } else {
            if (filesize < size) {
                flag = CopyFile.copyFileUsingJcifs(userName, password, sourcePath, destinationPath, filename);
                return flag;
            } else {
                log.info(message.getString("invalid.filesize"));
                return flag;
            }
        }
    }
}
