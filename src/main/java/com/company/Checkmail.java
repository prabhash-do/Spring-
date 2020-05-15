package com.company;

import javax.mail.MessagingException;
import java.io.IOException;

public class Checkmail {
    private Checkmail() {
    }

    /**
     * Display Subject of Unread mails in Gmail folder
     *
     * @param foldername
     * @throws IOException
     * @throws MessagingException
     * @Command java -jar <jarname.jar> -r <foldername>
     */
    public static void readMail(String foldername) throws IOException, MessagingException {
        Readmail.readSubjectOfMailFolder(foldername);
    }
}
