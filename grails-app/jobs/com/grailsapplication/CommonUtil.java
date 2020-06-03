

package com.grailsapplication;

import javax.servlet.http.HttpServletResponse;

public class CommonUtil {


    private CommonUtil() {
    }

    public static void clearBrowserCache(HttpServletResponse response) {
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 1L);
        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Cache-Control", "no-store");
    }


}
