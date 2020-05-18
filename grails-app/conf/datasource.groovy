dataSource {

    /* ----------- For PostgreSQL 12.2 -----------*/
    dialect = "org.hibernate.dialect.PostgreSQLDialect"
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "Independent12#"
    url = "jdbc:postgresql://localhost:5432/docupload"

    logSql = true
    pooled = true
    minPoolSize = 100
    maxPoolSize = 2000
    maxIdleTime = 1800
    initialPoolSize = 100
    acquireIncrement = 100
    //dbCreate="update"
    dbCreate="create-drop"
    unreturnedConnectionTimeout = 3600
    debugUnreturnedConnectionStackTraces = true
}

hibernate {

    /*Do not change the below configuration without consulting CloudBlue Technical Support
      Start of configuration
     */
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

