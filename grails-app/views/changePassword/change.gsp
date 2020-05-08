<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code="springSecurity.change.password.title"></g:message></title>
</head>

<body>
<div class="row">

    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center"><g:message code="springSecurity.change.password.header"></g:message></h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin"  action="changepassword" method="POST" id="loginForm" autocomplete="off">

                    <div class="form-group">
                        <label for="currentpassword"><g:message code="springSecurity.current.password.label"></g:message></label>
                        <input type="password" placeholder="Current password" class="form-control" name="currentpassword"
                               id="currentpassword" required/>
                    </div>
                    <div class="form-group">
                        <label for="newpassword"><g:message
                                code="springSecurity.new.password.label"></g:message></label>
                        <input type="password"  placeholder="New password" class="form-control" name="newpassword"
                               id="newpassword" required/>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword"><g:message
                                code="springSecurity.confirm.password.label"></g:message></label>
                        <input type="password"  placeholder="Confirm new password" class="form-control" name="confirmpassword"
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