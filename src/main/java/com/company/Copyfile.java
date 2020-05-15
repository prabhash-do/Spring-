package com.company;

import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;
import jcifs.smb.SmbFileOutputStream;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import static com.company.Accessfile.*;

public class Copyfile {

    private Copyfile() {
    }

    static Logger log = Logger.getLogger(Copyfile.class);

    /**
     * This method copy a file to shared folder
     *
     * @param userName
     * @param password
     * @param sourcePath
     * @param destinationPath
     * @throws IOException
     */
    public static boolean copyFileUsingJcifs(String userName, String password, String sourcePath, String destinationPath, String fileName) throws IOException {

        destinationPath = destinationPath + fileName;
        final NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(null, userName, password);
        log.info(message.getString("processing.message"));
        try (FileInputStream fileInputStream = new FileInputStream(new File(sourcePath))) {
            final SmbFile sFile = new SmbFile(destinationPath, auth);
            try (SmbFileOutputStream smbFileOutputStream = new SmbFileOutputStream(sFile)) {
                final byte[] buf = new byte[10 * 1024 * 1024];
                int len;
                while ((len = fileInputStream.read(buf)) > 0) {
                    smbFileOutputStream.write(buf, 0, len);
                }
                log.info(message.getString("success.copy.message"));
                return true;
            }
        } catch (Exception e) {
            log.error("Exception occured while coping file:\n", e);
        }
        return false;
    }
}



