package com.company;

import java.io.IOException;

public class Checklistfile {

    private Checklistfile() {
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

        Listfile.listFileUsingJcifs(userName, password, destinationPath);
    }
}
