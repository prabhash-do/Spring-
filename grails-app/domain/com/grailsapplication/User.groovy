package com.grailsapplication

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString


@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String firstName
    String lastName
    String email
    String mobileNumber
    String username
    String password
    String sex
    String dateOfBirth

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    static hasMany = [coordinates: SecurityCoordinate]

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']

    static constraints = {
        firstName nullable: false, blank:true
        lastName nullable: true,blank:true
        email nullable: false,blank: false
        mobileNumber nullable: true,blank: true
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
        sex nullable: false,blank:true
        dateOfBirth nullable: true,blank:true
    }

    static mapping = {
        id generator:'sequence', params:[sequence_name:'seq_user']
        password column: '`password`'
        table '`user`'

    }
}