import com.grailsapplication.UserPasswordEncoderListener
import com.grailsapplication.CoordinateValidatorService
import com.grailsapplication.TwoFactorAuthenticationProvider
import com.grailsapplication.TwoFactorAuthenticationDetailsSource
import com.mchange.v2.c3p0.ComboPooledDataSource
import grails.util.Holders

// Place your Spring DSL code here
beans = {

    userDetailsService(com.grailsapplication.UserDetail)
    dataSource(ComboPooledDataSource) { bean ->
        bean.destroyMethod = 'close'

        // database connection properties from datasource.groovy
        user = Holders.config.dataSource.username
        password = Holders.config.dataSource.password
        driverClass = Holders.config.dataSource.driverClassName
        jdbcUrl = Holders.config.dataSource.url

        // Connection pooling using c3p0
        /*
        http://www.mchange.com/projects/c3p0/#managing_pool_size
        http://javatech.org/2007/11/c3p0-connectionpool-configuration-rules-of-thumb/
        unreturnedConnectionTimeout=3600 (1hr) , because some transaction may take long time to complete
        , like notification template creation for reseller and version synchronization.

        numHelperThreads=8 This will improve DB performance (Tested).
        debugUnreturnedConnectionStackTraces = false (set it true if need to debug  some connectivity problem)
         */
        acquireIncrement = Holders.config.dataSource.acquireIncrement
        initialPoolSize = Holders.config.dataSource.initialPoolSize
        minPoolSize = Holders.config.dataSource.minPoolSize
        maxPoolSize = Holders.config.dataSource.maxPoolSize
        maxIdleTimeExcessConnections = 30
        checkoutTimeout = 30000
        numHelperThreads = 8
        /*
          Destroy un-returned connections after a period of time (in seconds) and throw an exception
          that shows who is still holding the un-returned connection. Useful for debugging connection
          leaks.
        */
        unreturnedConnectionTimeout = Holders.config.dataSource.unreturnedConnectionTimeout
        maxIdleTime = Holders.config.dataSource.maxIdleTime
        debugUnreturnedConnectionStackTraces = Holders.config.dataSource.debugUnreturnedConnectionStackTraces

        /*
          Periodically test the state of idle connections and validate connections on checkout. Handles
          potential timeouts by the database server. Increase the connection idle test period if you
          have intermittent database connection issues.
        */
        testConnectionOnCheckout = false
        testConnectionOnCheckin = true
        idleConnectionTestPeriod = 180
        preferredTestQuery = "select 1"
    }

    userPasswordEncoderListener(UserPasswordEncoderListener)
    coordinateValidator(CoordinateValidatorService)
    twoFactorAuthenticationProvider(TwoFactorAuthenticationProvider) {
        coordinateValidator = ref('coordinateValidator')
        userDetailsService = ref('userDetailsService')
        passwordEncoder = ref('passwordEncoder')
        userCache = ref('userCache')
        preAuthenticationChecks = ref('preAuthenticationChecks')
        postAuthenticationChecks = ref('postAuthenticationChecks')
        authoritiesMapper = ref('authoritiesMapper')
        hideUserNotFoundExceptions = true
    }
    authenticationDetailsSource(TwoFactorAuthenticationDetailsSource)
}
