<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<a class="navbar-brand" href="/#"><asset:image src="bankcard.jpg" alt="Bankcard Logo"/></a>

<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body ">
                <h5 class="card-title text-center"><g:message code="springSecurity.login.header"></g:message></h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"
                      autocomplete="off">
                    <div class="form-group">
                        <label for="username"><g:message code="springSecurity.login.username.label"></g:message></label>
                        <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"
                               autocapitalize="none" />
                    </div>

                    <div class="form-group">
                        <label for="password"><g:message code="springSecurity.login.password.label"></g:message></label>

                        <div class="input-group mb-2 mr-sm-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i id="passwordToggler" title="show password"
                                       onclick="passwordDisplayToggle()">&#128065;</i></div>
                            </div>
                            <input type="password" class="form-control" name="${passwordParameter ?: 'password'}"
                                   id="password" placeholder="Type Your Password"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="coordinateValue">${position}</label>
                        <input type="hidden" name="coordinatePosition" id="coordinatePosition" value="${position}"/>
                        <input type="text" class="form-control" name="coordinateValue" id="coordinateValue"/>
                    </div>

                    <div class="form-group form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"
                                   name="${rememberMeParameter ?: 'remember-me'}" id="remember_me"
                                   <g:if test='${hasCookie}'>checked="checked"</g:if>/><g:message
                                code="springSecurity.login.remember.me.label"></g:message>
                        </label>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><g:message
                            code="springSecurity.login.button"></g:message></button>
                    <hr class="my-4">

                    <p><g:message code="springSecuirity.register.account">
                    </g:message><g:link controller="register"><g:message
                            code="springSecurity.register.button"></g:message></g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="validator.js"/>
</body>
</html>`