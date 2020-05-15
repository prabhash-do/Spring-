package com.company;

import java.io.IOException;

public class CheckListFile {

    private CheckListFile() {
    }

    /**
     * List file present in shared location
     *
     * @param userName
     * @param password
     * @param destinationPath
     * @throws IOException
     * @Command java -jar <jarname.jar> -l
     */
    public static void listFile(String userName, String password, String destinationPath) throws IOException {

        ListFile.listFileUsingJcifs(userName, password, destinationPath);
    }
}
