<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code="springSecurity.reset.password.title"></g:message></title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center"><g:message code="springSecurity.reset.password.header"></g:message></h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="resetpassword" method="POST" id="loginForm" autocomplete="off">

                    <div class="form-group">
                        <label for="password"><g:message code="springSecurity.login.password.label"></g:message></label>
                        <input type="password" placeholder="Your password" class="form-control" name="password"
                               id="password" required/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message
                                code="springSecurity.confirm.password.label"></g:message></label>
                        <input type="password" placeholder="Confirm password" class="form-control" name="confirmpassword"
                               id="confirmpassword" required/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><g:message
                            code="springSecurity.submit.button"></g:message></button>
                    <hr class="my-4">

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>