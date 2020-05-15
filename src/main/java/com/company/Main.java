
package com.company;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;

import static com.company.AccessFile.*;

public class Main {

    static Logger log = Logger.getLogger(Main.class);

    /**
     * This is a main method
     *
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {

        String userName = config.getString("userName");
        String password = Decrypt.getDecryptedPassword(config.getString("password"));
        String destinationPath = config.getString("destinationPath");
        String sourcePath;
        String filename;
        String foldername;


        try {
            String _switch = args[0];
            switch (_switch.toLowerCase()) {
                case "-f":
                    sourcePath = args[1];
                    filename = sourcePath.substring(sourcePath.lastIndexOf('/') + 1);
                    File tempFile = new File(sourcePath);
                    if (tempFile.exists()) {
                        CheckCopyFile.copyFile(userName, password, destinationPath, sourcePath, filename);
                        SendMail.mail(filename);
                        //SendSms.sendsms(filename);
                    } else {
                        log.info(message.getString("invalid.message"));
                    }
                    break;
                case "-l":
                    CheckListFile.listFile(userName, password, destinationPath);
                    break;
                case "-d":
                    filename = args[1];
                    CheckDeleteFile.deleteFile(filename);
                    break;
                case "-r":
                    foldername = args[1];
                    CheckMail.readMail(foldername);
                    break;
                default:
                    log.warn((message.getString("command.execute.case")));
            }
        } catch (Exception e) {
            log.error((message.getString("command.execute.jar")), e);
        }
    }
}
