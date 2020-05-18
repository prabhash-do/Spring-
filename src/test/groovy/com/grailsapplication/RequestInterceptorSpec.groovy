package com.grailsapplication

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class RequestInterceptorSpec extends Specification implements InterceptorUnitTest<RequestInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test first interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"first")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
