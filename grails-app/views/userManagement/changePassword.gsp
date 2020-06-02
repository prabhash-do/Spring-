<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.change.password.title')}</title>
    <style>

    .card {
        width: 80%;
    }
    </style>
</head>

<body class="w3-light-grey">
<div class="row" style=" margin-left:400px;margin-top: 80px;">

    <div class="card card-signin my-5">
        <div class="card-body">
            <h5 class="card-title text-center">${message(code: 'springSecurity.change.password.header')}</h5>
            <g:render template="/templates/grailstemplates"/>
            <form class="form-signin" action="changePassword" method="POST" id="registerForm"
                  onsubmit="return checkPassword();"
                  autocomplete="off">

                <div class="form-group">
                    <label for="currentpassword">${message(code: 'springSecurity.current.password.label')}</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="password" placeholder="${message(code: 'springSecurity.current.password.label')}"
                               value="${currentpassword}"
                               class="form-control"
                               name="currentpassword"
                               id="currentpassword" required/>

                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i id="opass-status" class="fa fa-eye" aria-hidden="true"
                                   onClick="viewOldPassword()"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">${message(code: 'springSecurity.new.password.label')}</label>
                    <td align="left"><span id="isP"></span>
                        <div class="input-group mb-2 mr-sm-2">
                            <input type="password" placeholder="${message(code: 'springSecurity.new.password.label')}"
                                   class="form-control" name="password"
                                   id="password" required/>

                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i id="pass-status" class="fa fa-eye" aria-hidden="true"
                                       onClick="viewPassword()"></i>
                                </div>
                            </div>
                            <div class="tooltips">
                                <asset:image src="tooltip.png" alt="Image"/><span
                                    class="tooltiptext">${message(code: 'default.password.format')}</span>
                            </div>
                        </div>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">${message(code: 'springSecurity.confirm.password.label')}</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="password" placeholder="${message(code: 'springSecurity.confirm.password.label')}"
                               class="form-control"
                               name="confirmPassword"
                               id="confirmPassword" required/>

                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i id="cpass-status" class="fa fa-eye" aria-hidden="true"
                                   onClick="viewConfirmPassword()"></i>
                            </div>
                        </div>
                    </div>
                    <span id='message'></span>
                </div>
                <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                        type="submit">${message(code: 'springSecurity.submit.button')}</button>
                <hr class="my-4">
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
        document.forms['registerForm'].elements['currentpassword'].focus();
    });
</g:javascript>
<asset:javascript src="validator.js"/>
</body>
</html>