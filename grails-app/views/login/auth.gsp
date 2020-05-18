<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.login.title')}</title>
</head>

<body>
<a class="navbar-brand" href="/#"><asset:image src="bankcard.jpg" alt="Bankcard Logo"/></a>

<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body ">
                <h5 class="card-title text-center">${message(code: 'springSecurity.login.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"
                      autocomplete="off">
                    <div class="form-group">
                        <label for="username">${message(code: 'springSecurity.login.username.label')}</label>
                        <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username"
                               placeholder="${message(code: 'springSecurity.login.username.label')}" autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="password">${message(code: 'springSecurity.login.password.label')}</label>
                        <link rel="stylesheet"
                              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

                        <div class="input-group mb-2 mr-sm-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i id="pass-status" class="fa fa-eye" aria-hidden="true"
                                       onClick="viewPassword()"></i>
                                </div>
                            </div>
                            <input type="password" class="form-control" name="${passwordParameter ?: 'password'}"
                                   id="password" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="coordinateValue">${position}</label>
                        <input type="hidden" name="coordinatePosition" id="coordinatePosition" value="${position}"/>
                        <input type="text" class="form-control" name="coordinateValue" id="coordinateValue"
                               placeholder="${message(code: 'springSecurity.login.coordinate.value')}" required/>
                    </div>

                    <div class="form-group form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input"
                                   name="${rememberMeParameter ?: 'remember-me'}" id="remember_me"
                                   <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            ${message(code: 'springSecurity.login.remember.me.label')}
                        </label>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">
                        ${message(code: 'springSecurity.login.button')}</button>
                    <hr class="my-4">

                    <p><g:message code="springSecuirity.register.account">
                    </g:message><g:link controller="register">
                        ${message(code: 'springSecurity.register.button')}</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="validator.js"/>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function (event) {
        document.forms['loginForm'].elements['username'].focus();
    });
</g:javascript>
</body>
</html>`