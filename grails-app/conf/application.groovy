// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.grailsapplication.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.grailsapplication.UserRole'
grails.plugin.springsecurity.authority.className = 'com.grailsapplication.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern:  '/simpleCaptcha/**', access: ['permitAll']],
        [pattern: '/**/upload/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**', filters: 'none'],
        [pattern: '/**/js/**', filters: 'none'],
        [pattern: '/**/css/**', filters: 'none'],
        [pattern: '/**/images/**', filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**', filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.providerNames = [
        'twoFactorAuthenticationProvider',
        'anonymousAuthenticationProvider',
        'rememberMeAuthenticationProvider']

grails.plugin.springsecurity.logout.postOnly = false
//grails.plugins.springsecurity.successHandler.alwaysUseDefault = true
//grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/secured'
