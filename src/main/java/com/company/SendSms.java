package com.company;

import org.apache.log4j.Logger;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.MessageFormat;

import static com.company.AccessFile.*;

public class SendSms {

    SendSms() {
    }

    static Logger log = Logger.getLogger(SendSms.class);

    /**
     * This method basically sends a SMS to user's mobile no. while user has copied a file to shared folder successfully!
     *
     * @param filename
     */
    public static void sendsms(String filename,String number,String action) {
        try {
            String to = number;
            String smsbody_upload = message.getString("sms.body.message.upload");
            String smsbody_delete = message.getString("sms.body.message.delete");
            String smsbody_user_creation = message.getString("sms.body.message.user.creation");
            String smsbody_password = message.getString("sms.body.message.password");
            String smsbody_dummy = message.getString("sms.body.message.dummy");
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

            if(action=="upload"){
                smsbody_upload = MessageFormat.format(smsbody_upload, filename);
                smsbody_upload = URLEncoder.encode(smsbody_upload, "UTF-8");
                requestUrl = MessageFormat.format(requestUrl, smsbody_upload);
            }else if(action=="delete"){
                smsbody_delete = MessageFormat.format(smsbody_delete, filename);
                smsbody_delete = URLEncoder.encode(smsbody_delete, "UTF-8");
                requestUrl = MessageFormat.format(requestUrl, smsbody_delete);
            }else if (action=="user_creation"){
                smsbody_user_creation = MessageFormat.format(smsbody_user_creation, filename);
                smsbody_user_creation = URLEncoder.encode(smsbody_user_creation, "UTF-8");
                requestUrl = MessageFormat.format(requestUrl, smsbody_user_creation);
            }else if (action=="reset_password"){
                smsbody_password = MessageFormat.format(smsbody_password,"");
                smsbody_password = URLEncoder.encode(smsbody_password, "UTF-8");
                requestUrl = MessageFormat.format(requestUrl, smsbody_password);
            }else if(action=="dummy_sms"){
                smsbody_dummy = MessageFormat.format(smsbody_dummy,"");
                smsbody_dummy = URLEncoder.encode(smsbody_dummy, "UTF-8");
                requestUrl = MessageFormat.format(requestUrl, smsbody_dummy);
            }
            URL url = new URL(requestUrl);
            HttpURLConnection connect = (HttpURLConnection) url.openConnection();
            log.info(connect.getResponseMessage() + message.getString("success.message.sent"));
            connect.disconnect();
        } catch (Exception e) {
            log.error("Exception occured while sending SMS:\n", e);
        }
    }
}
