package com.grailsapplication

class Uploadfile {

    String fileName
    String creationDate
    String fileSize
    boolean status
    int id



    static constraints = {
        id maxsize: 300*1024*8
        fileName maxsize: 99999999
        fileName(unique: ['status'])
    }
    static mapping = {
        id generator:'sequence', params:[sequence_name:'seq_upload_file']
        version false
    }
}
