<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.register.title')}</title>
</head>

<body>
<div class="w3-main" style="margin-left:100px;margin-top: 80px;">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">${message(code: 'springSecurity.register.header')}</h5>
                    <g:render template="/templates/grailstemplates"/>
                    <form class="form-signin" onsubmit="return !!(validateEmailByRegex() & checkPassword());"
                          action="register"
                          method="POST" id="registerForm" autocomplete="off">

                        <div class="form-group">
                            <label for="firstname">*${message(code: 'springSecurity.register.firstname.label')}</label>
                            <input type="text" placeholder="${message(code: 'springSecurity.register.firstname.label')}"
                                   class="form-control" name="firstname"
                                   id="firstname"
                                   autocapitalize="none" required/>
                        </div>

                        <div class="form-group">
                            <label for="lastname">${message(code: 'springSecurity.register.lastname.label')}</label>
                            <input type="text" placeholder="${message(code: 'springSecurity.register.lastname.label')}"
                                   class="form-control" name="lastname"
                                   id="lastname"
                                   autocapitalize="none"/>
                        </div>

                        <div class="form-group">
                            <label for="email">*${message(code: 'springSecurity.register.email.label')}</label>
                            <td align="left"><span id="isE"></span>
                                <div class="input-group mb-2 mr-sm-2">
                                    <input type="text" placeholder="${message(code: 'springSecurity.register.email.label')}"
                                           class="form-control" name="email"
                                           id="email"
                                           autocapitalize="none" required/>
                                    <div class="tooltips">
                                        <asset:image src="tooltip.png" alt="Image"/><span class="tooltiptext">${message(code: 'default.email.format')}</span>
                                    </div>
                                </div>
                        </div>

                        <div class="form-group">
                            <label for="mobilenumber">${message(code: 'springSecurity.register.mobilenumber.label')}</label>
                            <input type="text"
                                   placeholder="${message(code: 'springSecurity.register.mobilenumber.label')}"
                                   class="form-control"
                                   name="mobilenumber"
                                   id="mobilenumber" minlength="10" onkeypress="return isNumberKey1(event)"
                                   autocapitalize="none"/>
                        </div>

                        <div class="form-group">
                            <label>*${message(code: 'springSecurity.register.sex.label')}</label>
                            <select class="custom-select" name="sex" id="sex" required="required">
                                <option value="${message(code: 'register.sex.male')}"
                                        selected>${message(code: 'register.sex.male')}</option>
                                <option value="${message(code: 'register.sex.female')}">${message(code: 'register.sex.female')}</option>
                                <option value="${message(code: 'register.sex.others')}">${message(code: 'register.sex.others')}</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="dateofbirth">${message(code: 'springSecurity.register.date.label')}</label>
                            <input type="date" value="2020-05-20" name="dateofbirth" id="dateofbirth" min="1950-01-01"
                                   max="2050-12-31">
                        </div>

                        <div class="form-group">
                            <label for="username">*${message(code: 'springSecurity.login.username.label')}</label><td
                                align="left"><span id="isU"></span>
                            <input type="text" placeholder="${message(code: 'springSecurity.login.username.label')}"
                                   class="form-control" name="username"
                                   id="username"
                                   autocapitalize="none" required/>
                        </div>

                        <div class="form-group">
                            <label for="password">*${message(code: 'springSecurity.autogenerated.password.label')}</label>
                            <label class="switch">
                                <input type="checkbox" id="checkbox" checked>
                                <span class="slider round"></span>
                            </label>
                            <td align="left"><span id="isP"></span>
                                <link rel="stylesheet"
                                      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i id="pass-status" class="fa fa-eye" aria-hidden="true"
                                               onClick="viewPassword()"></i>
                                        </div>
                                    </div>
                                    <input type="password" class="form-control" name="password"
                                           id="password"
                                           required/>
                                    <div class="tooltips">
                                        <asset:image src="tooltip.png" alt="Image"/><span class="tooltiptext">${message(code: 'default.password.format')}</span>
                                    </div>
                                </div>
                        </div>

                        <div class="form-group" id="reenterpassword">
                            <label for="password">*${message(code: 'springSecurity.confirm.password.label')}</label>
                            <input type="password" class="form-control" name="confirmPassword" value=""
                                   id="confirmPassword"/>
                        </div>
                        <div class="form-group">
                            <label for="captcha"></label>
                            <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}" id="captcha"
                                 name='captcha'/>
                            <asset:image src="Reload.png" class="glyphicon glyphicon-refresh"
                                         alt="Click to reload image"
                                         title="Click to reload image" onclick="reloadCaptcha()"/>
                            <g:textField name="captcha"
                                         placeholder="${message(code: 'springSecurity.login.captcha.label')}"
                                         class="form-control1"
                                         required="true"/>
                        </div>
                        <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                                type="submit">${message(code: 'springSecurity.register.button')}</button>
                    </form>

                    <p>${message(code: 'springSecuirity.have.account')}
                        <g:link controller="login"
                                action="auth">${message(code: 'springSecurity.login.button')}</g:link></p>
                </div>
            </div>
        </div>
    </div>
</div>
%{--<footer class="w3-container w3-padding-0 w3-light-grey" style="margin-bottom: 0px; margin-left: 0px;margin-right: 0px">
    <div class="footer row" role="contentinfo">
        <p><g:message code="default.index.footer.message"></g:message></p>
    </div>
</footer>--}%
<g:javascript>
        document.addEventListener("DOMContentLoaded", function () {
        $("#username").blur(function(){
                if($(this).length > 0) {
                    var url = "${createLink(controller: 'register', action: 'checkUserNameAvailable')}"
                    $.getJSON(url, {id:$(this).val()}, function(json){
                        if(!json.available) {
                            $("#username").css("border", "1px solid red");
                            document.getElementById("isU").style.color = "red";
                            document.getElementById("isU").innerHTML = "${message(code: 'check.username.available.no')}";
                        }
                        else{
                             $("#username").css("border", "1px solid green");
                            document.getElementById("isU").style.color = "green";
                            document.getElementById("isU").innerHTML = "${message(code: 'check.username.available.yes')}";
                        }
                    });
                }
            });

            document.forms['registerForm'].elements['firstname'].focus();
            var checkbox = document.querySelector('input[type="checkbox"]');
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("confirmPassword");
            if (checkbox.checked) {
                password.value = generatePassword()
                confirmPassword.removeAttribute('required');
                $('#reenterpassword').hide();
            }
            checkbox.addEventListener('change', function () {
                if (checkbox.checked) {
                   password.value = generatePassword()
                    confirmPassword.removeAttribute('required');
                    $('#reenterpassword').hide();
                } else {
                    confirmPassword.value = typePassword()
                    password.value = typePassword()
                    confirmPassword.setAttribute('required', 'required');
                }
            });
        });
        function generatePassword() {
            var randomString = Math.random().toString(36).slice(-8).concat('@T2t');
            return randomString;
        }
        function typePassword() {
            document.getElementById("confirmPassword").setAttribute('value', '');
            $('#password').show()
            $('#reenterpassword').show()
            return null
        }

</g:javascript>
<asset:javascript src="validator.js"/>
</body>
</html>