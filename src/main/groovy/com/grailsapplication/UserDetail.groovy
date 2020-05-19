package com.grailsapplication

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.plugin.springsecurity.userdetails.GrailsUserDetailsService
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

class UserDetail implements GrailsUserDetailsService {
    static final List NO_ROLES =
            [new SimpleGrantedAuthority(SpringSecurityUtils.NO_ROLE)]

    UserDetails loadUserByUsername(String username, boolean loadRoles)
            throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User.withTransaction { status ->
            User user = User.findByUsernameIlike(username, username)
            if (!user) {
                throw new UsernameNotFoundException('User not found',
                        username)

            }
            def authorities = user.authorities.collect {
                new SimpleGrantedAuthority(it.authority)
            }

            return new GrailsUser(user.username,
                    user.password,
                    user.enabled,
                    !user.accountExpired,
                    !user.passwordExpired,
                    !user.accountLocked,
                    authorities ?: NO_ROLES,
                    user.id)
        }
    }
}