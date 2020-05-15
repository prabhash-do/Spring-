package com.company;

import org.apache.log4j.Logger;

import java.net.URL;
import java.net.URLConnection;

import static com.company.AccessFile.config;

public class CheckConnetivity {

    private static Logger log = Logger.getLogger(CheckConnetivity.class);

    private CheckConnetivity() {
    }

    /**
     * This method Checks Internet connectivity in your system
     *
     * @return true if system is connected to Internet
     */
    public static boolean internetConnection() {
        try {
            URL url = new URL(config.getString("check.url"));
            URLConnection connection = url.openConnection();
            connection.connect();
            return true;
        } catch (Exception e) {
            log.error("Check Internet connectivity.Error occured due to" + e.getMessage());
            return false;
        }
    }
}
