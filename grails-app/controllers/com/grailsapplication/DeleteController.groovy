/**
 * Method doDelete() is allowed to delete each file present in remote location
 */
package com.grailsapplication

import com.company.Checkconnetivity
import com.company.Deletefile
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class DeleteController {

    def index() {
    }

    def doDelete = {

        def filename = params.filename
        if (Checkconnetivity.internetConnection()) {
            if (Deletefile.deleteFileUsingJcifs(filename)) {
                log.info("File has been deleted successfully from Remote Location!")
                flash.message = g.message(code: "flash.message.file.delete")
                redirect controller: "listing", action: "doListing"
            }
        } else {
            flash.error = g.message(code: "flash.message.check.connectivity")
            redirect controller: "listing", action: "doListing"
        }
    }

    def userdelete(){

        def user = User.findById(params.userid)
        def userrole = UserRole.findByUser_Id(params.userid)
        user.delete(flush:true)
        redirect controller: "userManagement", action: "index"
    }
}
