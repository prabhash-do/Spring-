<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:stylesheet src="w3.css"/>
    <asset:stylesheet src="raleway.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>

<body class="w3-light-gray">
<div class="w3-bar w3-top w3-indigo w3-large" style="z-index:4">
    <span class="w3-container w3-left"><a class="navbar-brand"
                                          href="${g.createLink(controller: "secured")}"><asset:image src="Sfile.png"
                                                                                                     alt="Files Logo"/></a>
    </span>
    <span class="w3-bar-item w3-right">
        <div class="w3-right" aria-expanded="false" style="height: 0.8px; alignment: right" id="navbarContent">

            <sec:ifLoggedIn>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button"
                            style="color:black; background-color: white" data-toggle="dropdown">
                        <span><g:message code="main.page.user.welcome"/><strong>
                            <sec:username/></strong></span>
                    </button>

                    <div class="dropdown-menu" style="background-color: #fff">
                        <li>
                            <a style="color: #000000;"
                               href="${g.createLink(controller: "myProfile", action: "showProfileDetails")}"
                               class="w3-bar-item"><i class="fa fa-user"></i>
                                ${message(code: 'default.myprofile.header')}</a>
                        </li>
                        <li>
                            <a style="color: #000000;"
                               href="${g.createLink(controller: "userManagement", action: "change")}"
                               class="w3-bar-item"><i class="fa fa-edit"></i>
                                ${message(code: 'default.button.change')}</a>
                        </li>
                        <li>
                            <a style="color: #000000;"
                               href="${g.createLink(controller: "logout", action: "logout")}"
                               class="w3-bar-item"><i class="fa fa-power-off"></i>
                                ${message(code: 'default.button.logout')}</a>
                        </li>
                    </div>
                </div>
            </sec:ifLoggedIn>
            <div class="dropdown" style="margin-top: 10px">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                        style="color: black; background-color: white" data-toggle="dropdown">
                    <g:message code="default.change.language"/>
                </button>

                <div class="dropdown-menu" style="background-color: #fff" aria-labelledby="dropdownMenuButton">
                    <navBar:localeDropdownListItems uri="${request.forwardURI}"/>
                </div>
            </div>
        </div>
    </span>
</div>
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5><g:message code="side.bar.index.head.title"/></h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.overview.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i
                    class="fa fa-eye fa-fw"></i><g:message code="side.bar.index.overview.title"/>
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.upload.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i
                    class="fa fa-upload fa-fw"></i><g:message code="side.bar.index.upload.title"/></a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.list.user.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i
                    class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
            <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'default.button.createuser')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i class="fa fa-user fa-fw"></i><g:message
                    code="default.button.createuser"/></a>

            <a id="sms" name="sms" href="<g:createLink controller='settings' action='doSms'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.sms.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i class="fa fa-commenting fa-fw"></i><g:message code="side.bar.index.sms.title"/></a>

            <a id="email_id" name="email_id" href="<g:createLink controller='settings' action='doEmail'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.email.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i class="fa fa-envelope fa-fw"></i><g:message code="side.bar.index.email.title"/></a>

            <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
               class="${pageProperty(name: 'page.menu.item') == "${g.message(code: 'side.bar.index.settings.title')}" ? 'w3-bar-item w3-button w3-padding w3-indigo' : 'w3-bar-item w3-button w3-padding'}"><i
                    class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>

        </div>
    </nav>
</sec:ifLoggedIn>
<g:layoutBody/>
<asset:javascript src="application.js"/>
</body>
</html>