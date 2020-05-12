package com.grailsapplication

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

import javax.validation.groups.Default

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String firstname
    String lastname
    String email
    String mobilenumber
    String username
    String password
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
        firstname nullable: false, blank:false
        lastname blank: true, nullable:true
        mobilenumber blank: true,nullable:true
        email email: true,blank: false
        username  blank: false, unique: true
        password blank: false, password: true
    }

    static mapping = {
        password column: '`password`'
        table '`user`'

    }
}