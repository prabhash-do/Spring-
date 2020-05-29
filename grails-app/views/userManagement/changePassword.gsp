<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.change.password.title')}</title>
    <style>

    .card{
        width :90%;
    }
    </style>
</head>

<body class="w3-light-grey">
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <hr>

    <div class="w3-container" style="margin-top: 100px;">
        <h5><g:message code="side.bar.index.head.title"/></h5>
    </div>

    <div class="w3-bar-block" style="margin-top: 15px;">
        <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i><g:message
                code="side.bar.index.overview.title"/>
        </a>
        <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-upload fa-fw"></i><g:message
                code="side.bar.index.upload.title"/></a>
        <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
           class="w3-bar-item w3-button w3-padding"><i
                class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
        <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i><g:message
                code="default.button.createuser"/></a>
        <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                code="side.bar.index.delete.all.files.title"/></a>
        <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
           class="w3-bar-item w3-button w3-padding"><i
                class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
        <a id="changePassword" name="changePassword" href="<g:createLink controller='userManagement' action='change'/>"
           class="w3-bar-item w3-button w3-padding w3-indigo"><i
                class="fa fa-edit"></i><g:message code="default.button.change"/></a>
    </div>
</nav>
<div class="row" style=" margin-left:400px;margin-top:80px;">

        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.change.password.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" action="changePassword" method="POST" id="changepasswordForm"
                      autocomplete="off">

                    <div class="form-group">
                        <label for="currentpassword">${message(code: 'springSecurity.current.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.current.password.label')}" value="${currentpassword}"
                               class="form-control"
                               name="currentpassword"
                               id="currentpassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="newpassword">${message(code: 'springSecurity.new.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.new.password.label')}" class="form-control" name="newpassword"
                               id="newpassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="confirmpassword">${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.confirm.password.label')}" class="form-control"
                               name="confirmpassword"
                               id="confirmpassword" required/>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                            type="submit">${message(code: 'springSecurity.submit.button')}</button>
                <hr><hr><hr><hr>
                </form>
                <g:form controller="myProfile" action="showProfileDetails">
                    <button id="cancel" class="btn btn-lg btn-secondary btn-block text-uppercase"
                            type="submit">${message(code: 'default.button.cancel')}</button>
                </g:form>
            </div>
    </div>
</div>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function () {
        document.forms['changepasswordForm'].elements['currentpassword'].focus();
    });
</g:javascript>
</body>
</html>