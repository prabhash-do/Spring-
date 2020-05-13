<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code="springSecurity.createuser.title"></g:message></title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center"><g:message code="springSecurity.createuser.header"></g:message></h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" action="createUser" method="POST" id="createUserForm" autocomplete="off">
                    <div class="form-group">
                        <label for="role"><g:message code="springSecurity.register.role"></g:message></label>
                        <g:select class="form-control" name="roleid"
                                  from="${com.grailsapplication.Role.list()}"
                                  optionKey="id"/>
                    </div>

                    <div class="form-group">
                        <label for="firstname"><g:message
                                code="springSecurity.register.firstname.label"></g:message></label>
                        <input type="text" placeholder="Your firstname" class="form-control" name="firstname"
                               id="firstname"
                               autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="lastname"><g:message
                                code="springSecurity.register.lastname.label"></g:message></label>
                        <input type="text" placeholder="Your lastname" class="form-control" name="lastname"
                               id="lastname"
                               autocapitalize="none"/>
                    </div>

                        <div class="form-group">
                            <label for="email"><g:message code="springSecurity.register.email.label"></g:message></label>
                            <input type="text" placeholder="Your email address" class="form-control" name="email" id="email"
                                   autocapitalize="none"/>
                        </div>

                    <div class="form-group">
                        <label for="mobilenumber"><g:message
                                code="springSecurity.register.mobilenumber.label"></g:message></label>
                        <input type="text" placeholder="Your mobile number" class="form-control" name="mobilenumber"
                               id="mobilenumber"
                               autocapitalize="none"/>
                    </div>


                    <div class="form-group">
                        <label for="username"><g:message code="springSecurity.login.username.label"></g:message></label>
                        <input type="text" placeholder="Your username" class="form-control" name="username"
                               id="username"
                               autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message code="springSecurity.login.password.label"></g:message></label>
                        <input type="password" placeholder="Your password" class="form-control" name="password"
                               id="password"/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message
                                code="springSecurity.login.reenter.password.label"></g:message></label>
                        <input type="password" placeholder="Re-enter password" class="form-control" name="repassword"
                               id="repassword"/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><g:message
                            code="default.add.user.button"></g:message></button>
                    <hr class="my-4">
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function (event) {
        document.forms['createUserForm'].elements['firstname'].focus();
    });
</script>
</body>
</html>