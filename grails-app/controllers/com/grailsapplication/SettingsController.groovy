package com.grailsapplication

import com.company.SendMail
import com.company.SendSms
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.validator.constraints.Email

@Secured('permitAll')
class SettingsController {

    def index() {}

    def doMail() {
        String email_id = params.mail
        String action = "dummy_mail"
        SendMail.mail("", email_id, action)
        log.info("Dummy mail has been sent successfully!")
        String message = g.message(code: "flash.message.dummy.email")
        render view: "email", model: [Mail: email_id, message: message]
    }

    def doSMS() {
        String number = params.mobilenumber
        String action = "dummy_sms"
        SendSms.sendsms("", number, action)
        log.info("Dummy SMS has been sent successfully!")
        String message = g.message(code: "flash.message.dummy.sms")
        render view: "sms", model: [mobilenumber: number, message: message]
    }

    def doSms() {
        render view: "sms"
    }

    def doEmail() {
        render view: "email"
    }

    def doSettings() {
        Settings settings = Settings.findByPropertyName("File size")
        if (settings != null) {
            Double fileSize1 = settings.propertyValue.toDouble()
            render view: "settings", model: [fileSize1: fileSize1]
        } else {
            render view: "settings"
        }
    }

    def doSubmitSettings() {
        Settings settings = Settings.findByPropertyName("File size")
        if (settings != null) {
            settings.propertyValue = params.propertyValue
            settings.save(flush: true)
        } else {
            settings = new Settings()
            settings.propertyName = "File size"
            settings.propertyValue = params.propertyValue
            settings.insert(flush: true)
        }
        Settings settings1 = Settings.findByPropertyName("Email_Upload")
        if (params.email_upload) {
            if (settings1 != null) {
                settings1.propertyValue = params.email_upload
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Upload"
                settings1.propertyValue = params.email_upload
                settings1.insert(flush: true)
            }
        }else{
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Upload"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Email_Delete")
        if (params.email_delete) {
            if (settings1 != null) {
                settings1.propertyValue = params.email_delete
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Delete"
                settings1.propertyValue = params.email_delete
                settings1.insert(flush: true)
            }
        }
        else{
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Delete"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Email_User_Creation")
        if (params.email_user) {
            if (settings1 != null) {
                settings1.propertyValue = params.email_user
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_User_Creation"
                settings1.propertyValue = params.email_user
                settings1.insert(flush: true)
            }
        }else{
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_User_Creation"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Email_Password_Change")
        if (params.email_password) {
            if (settings1 != null) {
                settings1.propertyValue = params.email_password
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Password_Change"
                settings1.propertyValue = params.email_password
                settings1.insert(flush: true)
            }
        }else {
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Email_Password_Change"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Sms_Upload")
        if (params.sms_upload) {
            if (settings1 != null) {
                settings1.propertyValue = params.sms_upload
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Upload"
                settings1.propertyValue = params.sms_upload
                settings1.insert(flush: true)
            }
        }else {
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Upload"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Sms_Delete")
        if (params.sms_delete) {
            if (settings1 != null) {
                settings1.propertyValue = params.sms_delete
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Delete"
                settings1.propertyValue = params.sms_delete
                settings1.insert(flush: true)
            }
        }else {
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Delete"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Sms_User_Creation")
        if (params.sms_user) {
            if (settings1 != null) {
                settings1.propertyValue = params.sms_user
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_User_Creation"
                settings1.propertyValue = params.sms_user
                settings1.insert(flush: true)
            }
        }else {
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_User_Creation"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        settings1 = Settings.findByPropertyName("Sms_Password_Change")
        if (params.sms_password) {
            if (settings1 != null) {
                settings1.propertyValue = params.sms_password
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Password_Change"
                settings1.propertyValue = params.sms_password
                settings1.insert(flush: true)
            }
        }else {
            if (settings1 != null) {
                settings1.propertyValue = "off"
                settings1.save(flush: true)
            } else {
                settings1 = new Settings()
                settings1.propertyName = "Sms_Password_Change"
                settings1.propertyValue = "off"
                settings1.insert(flush: true)
            }
        }

        Double fileSize1 = settings.propertyValue.toDouble()
        String message = g.message(code: "file.size.limit.save.alert", args: [fileSize1])
        render view: "settings", model: [fileSize1: fileSize1, email_upload: params.email_upload, email_delete: params.email_delete, email_user: params.email_user, email_password: params.email_password, sms_upload: params.sms_upload, sms_delete: params.sms_delete, sms_user: params.sms_user, sms_password: params.sms_password, message: message]
    }
}
