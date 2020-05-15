package com.company;

import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.Flags.Flag;
import javax.mail.search.FlagTerm;
import java.io.IOException;
import java.util.Properties;

import static com.company.AccessFile.*;

public class ReadMail {

    private ReadMail() {
    }

    static Logger log = Logger.getLogger(ReadMail.class);

    /**
     * This method displays the subject of all unread mails from a specific Gmail folder
     *
     * @param foldername
     * @throws IOException
     * @throws MessagingException
     */
    public static void readSubjectOfMailFolder(String foldername) throws IOException {

        Folder folder = null;

        String protocol = config.getString("email.protocol");
        String protocolname = config.getString("email.protocol.name");
        String mailhostname = config.getString("imap.host.name");
        String username = config.getString("email.sender.username");
        String password = Decrypt.getDecryptedPassword(config.getString("email.sender.password"));
        String imapfolder = config.getString("imap.Labels") + CamelCase.convertString(foldername);

        Properties properties = new Properties();
        properties.put(protocol, protocolname);
        try {

            Session session = Session.getDefaultInstance(properties, null);
            Store store = session.getStore(protocolname);
            store.connect(mailhostname, username, password);

            if (!foldername.equalsIgnoreCase("inbox")) {
                folder = store.getFolder(imapfolder);
                log.info("No of Unread Messages in " + foldername + "folder: " + folder.getUnreadMessageCount());
            } else {
                folder = store.getFolder(foldername);
                log.info("No of Unread Messages in " + foldername + "folder: " + folder.getUnreadMessageCount());
            }

            folder.open(Folder.READ_WRITE);

            Message messages[] = folder.search(new FlagTerm(new Flags(Flag.SEEN), false));

            for (Message message : messages) {
                message.setFlag(Flags.Flag.SEEN, true);
                log.info(" subject:" + message.getSubject());
            }
        } catch (Exception e) {
            log.error("Exception occured while reading unread mails of email folders:\n", e);
        }
    }
}


