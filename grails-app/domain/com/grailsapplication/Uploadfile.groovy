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
        id generator:'sequence', params:[sequence_name:'seq_upload_file']
        version false
    }
}
