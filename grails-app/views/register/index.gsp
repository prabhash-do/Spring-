<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.register.title')}</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.register.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" onsubmit="return (validateEmailByRegex('email'))" action="register"
                      method="POST" id="registerForm" autocomplete="off">

                    <div class="form-group">
                        <label for="firstname">*${message(code: 'springSecurity.register.firstname.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.firstname.label')}" class="form-control" name="firstname"
                               id="firstname"
                               autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="lastname">${message(code: 'springSecurity.register.lastname.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.lastname.label')}" class="form-control" name="lastname"
                               id="lastname"
                               autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="email">*${message(code: 'springSecurity.register.email.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.email.label')}" class="form-control" name="email"
                               id="email"
                               autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="mobilenumber">${message(code: 'springSecurity.register.mobilenumber.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.mobilenumber.label')}" class="form-control"
                               name="mobilenumber"
                               id="mobilenumber"
                               autocapitalize="none"/>
                    </div>


                    <div class="form-group">
                        <label for="username">*${message(code: 'springSecurity.login.username.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.login.username.label')}" class="form-control" name="username"
                               id="username"
                               autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="password">*${message(code: 'springSecurity.login.password.label')}</label>
                        <input type="password" class="form-control" name="password"
                               id="password" required/>
                    </div>

                    <div class="form-group">
                        <label for="password">*${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" class="form-control"
                               name="repassword"
                               id="repassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="captcha"></label>
                        <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}" id="captcha"
                             name='captcha'/>
                        <asset:image src="Reload.png" class="glyphicon glyphicon-refresh" alt="Click to reload image"
                                     title="Click to reload image" onclick="reloadCaptcha()"/>
                        <g:textField name="captcha" placeholder="${message(code: 'springSecurity.login.captcha.label')}" class="form-control1" required="true"/>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                            type="submit">${message(code: 'springSecurity.register.button')}</button>
                </form>

                <p>${message(code: 'springSecuirity.have.account')}
                    <g:link controller="login" action="auth">${message(code: 'springSecurity.login.button')}</g:link></p>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function (event) {
        document.forms['registerForm'].elements['firstname'].focus();
    });
</g:javascript>
<asset:javascript src="validator.js"/>
</body>
</html>