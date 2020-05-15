package com.company;

public class Camelcase {

    private Camelcase() {
    }

    public static String convertString(String foldername) {
        String result = "";
        char firstChar = foldername.charAt(0);
        result = result + Character.toUpperCase(firstChar);
        for (int i = 1; i < foldername.length(); i++) {
            char currentChar = foldername.charAt(i);
            char previousChar = foldername.charAt(i - 1);
            if (previousChar == ' ') {
                result = result + Character.toUpperCase(currentChar);
            } else {
                result = result + currentChar;
            }
        }
        return result;
    }
}
