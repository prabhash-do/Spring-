<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="file.jpg" alt="Files Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
            <sec:ifLoggedIn>

                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                <g:message code="default.dropdown.choose.action"></g:message>
                </a>
                <div class="dropdown-menu navbar-dark">
                <g:form controller="myProfile" action="showProfileDetails">
                    <input type='submit' id="submit" value="${message(code: 'default.button.myprofile')}"/>
                </g:form>
                <g:form controller="logout">
                    <input type='submit' id="submit" value="${message(code: 'default.button.logout')}"/>
                </g:form>

            </sec:ifLoggedIn>
        </ul>
    </div>

</nav>
<g:layoutBody/>
<asset:javascript src="application.js"/>
</body>
</html>
