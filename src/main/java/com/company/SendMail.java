package com.company;

import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

import static com.company.AccessFile.*;

public class SendMail {

    private SendMail() {
    }

    static Logger log = Logger.getLogger(SendMail.class);

    /**
     * This method basically sends an email to user's account while user has copied a file to shared folder successfully!
     *
     * @param filename
     * @throws IOException
     */
    public static void mail(String filename) throws IOException {

        final String sender = config.getString("email.sender.username");
        final String password = Decrypt.getDecryptedPassword(config.getString("email.sender.password"));
        final String receiver_to = config.getString("email.receipient.to");
        final String receiver_cc = config.getString("email.receipient.cc");

        String smtphost = config.getString("smtp.host");
        String smtphost_name = config.getString("smtp.host.name");
        String smtpport = config.getString("smtp.port");
        String smtpport_number = config.getString("smtp.port.number");
        String smtpauth = config.getString("smtp.auth");
        String smtpauth_value = config.getString("smtp.auth.value");
        String smtptls = config.getString("smtp.tls");
        String smtptls_value = config.getString("smtp.tls.value");

        Properties properties = new Properties();
        properties.put(smtphost, smtphost_name);
        properties.put(smtpport, smtpport_number);
        properties.put(smtpauth, smtpauth_value);
        properties.put(smtptls, smtptls_value);
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(RecipientType.TO, InternetAddress.parse(receiver_to));
            message.setRecipients(RecipientType.CC, InternetAddress.parse(receiver_cc));
            //  message.setSubject(bundle.getString("subject.of.mail"));
            message.setSubject(AccessFile.message.getString("subject.of.mail"));
            String mail = AccessFile.message.getString("mail.body");
            mail = mail.replace("#", filename);

            message.setText(mail);
            Transport.send(message);
            log.info(AccessFile.message.getString("success.message.mail"));
        } catch (Exception e) {
            log.error("Exception occured while sending mail:\n", e);
        }
    }
}
