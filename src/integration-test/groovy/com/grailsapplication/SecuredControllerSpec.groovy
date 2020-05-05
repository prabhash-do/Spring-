//package demo
//
//import com.grailsapplication.LoginPage
//import geb.spock.GebSpec
//import grails.testing.mixin.integration.Integration
//
//@Integration
//class SecuredControllerSpec extends GebSpec {
//
//    def 'test secured controller is secured'() {
//        when:
//        baseUrl = "http://localhost:${serverPort}/"
//        go 'secured'
//
//        then:
//        at LoginPage
//
//        when:
//        LoginPage loginPage = browser.page(LoginPage)
//        loginPage.login('user', 'user', BootStrap.BANKCARD[loginPage.position()])
//
//        then:
//        driver.pageSource.contains('index')
//    }
//}
