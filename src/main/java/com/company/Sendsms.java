package com.company;

import org.apache.log4j.Logger;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.MessageFormat;

import static com.company.Accessfile.*;

public class Sendsms {

    Sendsms() {
    }

    static Logger log = Logger.getLogger(Sendsms.class);

    /**
     * This method basically sends a SMS to user's mobile no. while user has copied a file to shared folder successfully!
     *
     * @param filename
     */
    public static void sendsms(String filename) {
        try {
            String to = config.getString("sms.receiver");
            String smsbody = message.getString("sms.body.message");
            String username = config.getString("sms.api.username");
            String password = Decrypt.getDecryptedPassword(config.getString("sms.api.password"));
            String sender = config.getString("sms.api.sender");
            String gatewayurl = config.getString("sms.gateway.url");

            String requestUrl = gatewayurl +
                    "username=" + username +
                    "&password=" + password +
                    "&sender=" + sender +
                    "&to=" + to +
                    "&message=" + "{0}" +
                    "&priority=1" + "&dnd=1&unicode=0";

            smsbody = MessageFormat.format(smsbody, filename);
            smsbody = URLEncoder.encode(smsbody, "UTF-8");
            requestUrl = MessageFormat.format(requestUrl, smsbody);
            URL url = new URL(requestUrl);
            HttpURLConnection connect = (HttpURLConnection) url.openConnection();
            log.info(connect.getResponseMessage() + message.getString("success.message.sent"));
            connect.disconnect();
        } catch (Exception e) {
            log.error("Exception occured while sending SMS:\n", e);
        }
    }
}
