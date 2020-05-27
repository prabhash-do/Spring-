package com.grailsapplication

class Settings implements Serializable {
    String propertyName
    String propertyValue

    static constraints = {
        propertyName nullable: false, blank:true, unique: true
        propertyValue nullable: false, blank:true
    }
}
