package com.company;

import jcifs.smb.NtlmPasswordAuthentication;
import jcifs.smb.SmbFile;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.util.ArrayList;

import static com.company.Accessfile.*;


public class Listfile {
    private Listfile() {
    }

    static Logger log = Logger.getLogger(Listfile.class);

    /**
     * This method lists all files along with their file size
     *
     * @param userName
     * @param password
     * @param destinationPath
     * @return
     * @throws IOException
     */
    public static ArrayList<String> listFileUsingJcifs(String userName, String password, String destinationPath) throws IOException {
        NtlmPasswordAuthentication auth = new NtlmPasswordAuthentication(null, userName, password);
        SmbFile sFile = new SmbFile(destinationPath, auth);
        SmbFile[] smfiles = sFile.listFiles();
        ArrayList<String> files = new ArrayList<String>();
        if (smfiles.length <= 0) {
            log.warn(message.getString("files.not.found"));
        } else {
            log.info(message.getString("success.list.message"));
            for (SmbFile f : sFile.listFiles()) {

                double length = f.length() / (1024.0);
                log.info(f.getName() + " " + length + " KB");
                files.add(f.getName());
            }
        }
        return files;
    }
}
