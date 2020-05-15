package com.company;

import javax.mail.MessagingException;
import java.io.IOException;

public class CheckMail {
    private CheckMail() {
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
        ReadMail.readSubjectOfMailFolder(foldername);
    }
}
