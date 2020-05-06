package com.grailsapplication

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

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
        firstname nullable: false, blank:true
        lastname nullable: false,blank:true
        email nullable: false,blank: false
        mobilenumber nullable: false,blank: true
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
    }

    static mapping = {
        password column: '`password`'
        table '`user`'
    }
}