<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <content tag="menu.item"><g:message code="side.bar.index.list.user.title"/></content>
    <title>${message(code: 'springSecurity.reset.password.title')}</title>
    <style>
        .card{
            width:80%;
        }
    .card-body{
            width:100%;
        }
    </style>
</head>
<body class="w3-light-grey">
<div class="row" style=" margin-left:400px;margin-top: 80px;">
         <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.reset.password.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <g:form class="form-signin" action="resetPassword" params="[username: username]" method="POST"
                        id="registerForm" onsubmit="return checkPassword();"
                        autocomplete="off">

                    <div class="form-group">
                        <label for="password">${message(code: 'springSecurity.new.password.label')}</label>
                        <td align="left"><span id="isP"></span>
                        <input type="password" placeholder="${message(code: 'springSecurity.new.password.label')}"
                               class="form-control" name="password"
                               id="password" required/>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.confirm.password.label')}"
                               class="form-control"
                               name="confirmPassword"
                               id="confirmPassword" required/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                            type="submit">${message(code: 'springSecurity.submit.button')}
                    </button>
                    <hr class="my-4">
                </g:form>
                <g:form controller="userManagement">
                    <button id="cancel" class="btn btn-lg btn-secondary btn-block text-uppercase"
                            type="submit">${message(code: 'default.button.cancel')}</button>
                </g:form>
        </div>
    </div>
</div>
<asset:javascript src="validator.js"/>
</body>
</html>