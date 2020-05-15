package com.grailsapplication

import com.company.CheckConnectivity

class ChangeStatusJob {
    static triggers = {
        simple name: 'simpleTrigger1', startDelay: 10000, repeatInterval: 40000, repeatCount: -1
    }

    def execute() {
        try {
            Uploadfile uploadfile = new Uploadfile()
            def dblist = uploadfile.list()
            def remotelist = ListRemoteFiles.list()
            if (remotelist != null) {
                for (def i = 0; i < dblist.size(); i++) {
                    def filename = dblist.get(i).fileName
                    boolean flag = remotelist.contains(filename)
                    if (!flag) {
                        Uploadfile.executeUpdate(
                                "update Uploadfile u set u.status = false where u.fileName = :filename ", [filename: filename])
                        log.info("File deleted from remote location!Job Status: True")
                    }
                }
            } else {
                log.warn("Batch job is not running . Check Internet connectivity!")
            }
        }
        catch (Exception e){
                log.error("Exception occured while changing status:\n", e)
        }
    }
}
