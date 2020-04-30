package com.grailsapplication

class DeleteStatusJob {
    static triggers = {
        simple name: 'simpleTrigger', startDelay: 10000, repeatInterval: 120000, repeatCount: -1 //DeleteJob runs in every 2 minutes
    }

    def execute() {
        Uploadfile.executeUpdate("DELETE FROM Uploadfile u WHERE u.status = false")
        log.info("File with status false is Deleted from Database")
    }
}
