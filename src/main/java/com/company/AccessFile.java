package com.company;


import java.util.ResourceBundle;

public class AccessFile {
    public static ResourceBundle message = ResourceBundle.getBundle("messages");
    public static ResourceBundle config = ResourceBundle.getBundle("config");

    private AccessFile() {
    }
}
