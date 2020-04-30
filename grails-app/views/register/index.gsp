<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
<title><g:message code="springSecurity.register.title"></g:message></title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center"><g:message code="springSecurity.register.header"></g:message></h5>
                    <g:if test='${flash.message}'>
                            <div class="alert alert-danger" role="alert">${flash.message}</div>
                    </g:if>
<form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">
    <div class="form-group">
        <label for="role"><g:message code="springSecurity.register.role"></g:message></label>
        <g:select class="form-control" name="roleid"
                  from="${com.grailsapplication.Role.list()}"
                  optionKey="id" />
    </div>

    <div class="form-group">
            <label for="username"><g:message code="springSecurity.login.username.label"></g:message></label>
            <input type="text" placeholder="Your username" class="form-control" name="username" id="username"
            autocapitalize="none"/>
    </div>

    <div class="form-group">
            <label for="password"><g:message code="springSecurity.login.password.label"></g:message></label>
            <input type="password" placeholder="Your password" class="form-control" name="password" id="password"/>
    </div>

    <div class="form-group">
            <label for="password"><g:message code="springSecurity.login.reenter.password.label"></g:message></label>
            <input type="password" placeholder="Re-enter password" class="form-control" name="repassword"
                   id="repassword"/>
    </div>

    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><g:message
                code="springSecurity.register.button"></g:message></button>
        <hr class="my-4">
        <p><g:message code="springSecuirity.have.account"></g:message>
            <g:link controller="login" action="auth"><g:message code="springSecurity.login.button"></g:message></g:link></p>
</form>
</div>
</div>
</div>
</div>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function (event) {
                document.forms['loginForm'].elements['username'].focus();
            });
        </script>
        </body>
        </html>