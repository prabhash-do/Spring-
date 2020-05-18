package com.grailsapplication


class RequestInterceptor {

    public RequestInterceptor(){
        matchAll().excludes(controller: 'login')
    }

    boolean before() {
        if(session.getAttribute("SPRING_SECURITY_CONTEXT")==null){
            redirect controller: 'login', action: 'auth'
            return false
        }
         return true }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
