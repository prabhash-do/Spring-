package com.grailsapplication

import grails.testing.web.taglib.TagLibUnitTest
import org.springframework.context.MessageSource
import spock.lang.Specification

class LocaleNavbarTagLibSpec extends Specification implements TagLibUnitTest<LocaleNavbarTagLib> {

    void "LocaleNavbarTagLib method localeDropdown renders"() {
        given:
        def uri = '/books'
        def languages = [[code: 'en', msg: 'English'],
                         [code: 'bn', msg: 'Bengali'],]

        when:
        def expected = ''
        languages.each { Map m ->
            expected += "<li><a href='${uri}?lang=${m.code}'>${m.msg}</a></li>"
        }
        tagLib.languages = languages.collect { it.code }
        tagLib.messageSource = Stub(MessageSource) {
            getMessage('language.en', [] as Object[], null, _ as Locale) >> languages.find { it.code == 'en'}.msg
            getMessage('language.bn', [] as Object[], null, _ as Locale) >> languages.find { it.code == 'bn'}.msg
        }
        def result = applyTemplate('<navBar:localeDropdownListItems uri="/books"/>')

        then:
        cleanUpString(result) == cleanUpString(expected)
    }

    String cleanUpString(String str) {
        str.replaceAll('\n','').replaceAll(' ', '')
    }
}
