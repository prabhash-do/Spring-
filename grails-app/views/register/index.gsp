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
                <form class="form-signin" onsubmit="return (validateEmailByRegex('email'))" action="register"
                      method="POST" id="loginForm" autocomplete="off">

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
                        <input type="text"  placeholder="Your mobile number" class="form-control" name="mobilenumber"
                               id="mobilenumber"
                               autocapitalize="none"/>
                    </div>


                    <div class="form-group">
                        <label for="username"><g:message code="springSecurity.login.username.label"></g:message></label>
                        <input type="text"placeholder="Your username" class="form-control" name="username"
                               id="username"
                               autocapitalize="none" required="true"/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message code="springSecurity.login.password.label"></g:message></label>
                        <input type="password" placeholder="Your password" class="form-control" name="password"
                               id="password" required="true"/>
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message
                                code="springSecurity.login.reenter.password.label"></g:message></label>
                        <input type="password"  placeholder="Re-enter password" class="form-control" name="repassword"
                               id="repassword" required="true"/>
                    </div>

                    <div >
                        <label for="captcha"><g:message code='springSecurity.login.captcha.label'/>:</label>
                        <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"  id="captcha" name ='captcha'/>
                        <asset:image src="Reload.png" class="glyphicon glyphicon-refresh" alt="Click to reload image" title="Click to reload image"  onclick="reloadCaptcha()"/>
                        <i class="material-icons" style="font-size:48px;color:red"></i>
                        <g:textField name="captcha" placeholder="Enter captcha" class="form-control1"/>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><g:message
                            code="springSecurity.register.button"></g:message></button>
                    <hr class="my-4">

                    <p><g:message code="springSecuirity.have.account"></g:message>
                        <g:link controller="login" action="auth"><g:message
                                code="springSecurity.login.button"></g:message></g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="validator.js"/>

        </body>
        </html>