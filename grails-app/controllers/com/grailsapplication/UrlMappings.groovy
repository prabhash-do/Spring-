package com.grailsapplication

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'secured')
//        "/"(view: '/auth')
        "500"(view: '/error')
        "404"(view: '/notFound')

    }
}
