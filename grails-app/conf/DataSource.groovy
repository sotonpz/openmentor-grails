dataSource {
    pooled = true
    //driverClassName = "org.hsqldb.jdbcDriver"
	//driverClassName = "org.h2.Driver"
	driverClassName= "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	username = "openmentor"
    password = "openmentor"
}
hibernate {
	jdbc.batch_size = 0
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            //dbCreate = "create" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
			//url = "jdbc:h2:mem:devDB"
			url="jdbc:mysql://localhost:3306/openmentor?characterEncoding=UTF-8"
			username = "openmentor"
			password = "openmentor"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/test_openmentor?characterEncoding=UTF-8"
			username='root'
			password=''
        }
    }
    staging {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/test_openmentor?characterEncoding=UTF-8"
			//username='root'
			//password=''
        }
    }
    production {
        dataSource {
            //dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/openmentor?characterEncoding=UTF-8"
			username = "openmentor"
			password = "openmentor"
        }
    }
}
