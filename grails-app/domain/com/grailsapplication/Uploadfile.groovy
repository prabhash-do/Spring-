package com.grailsapplication

class Uploadfile {

    String fileName
    boolean status
    int id



    static constraints = {

        id maxsize: 99999999
        fileName maxsize: 99999999
        fileName(unique: ['status'])
    }
    static mapping = {
        version false
    }
}
