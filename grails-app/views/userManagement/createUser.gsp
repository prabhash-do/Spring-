<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.createuser.title')}</title>
</head>

<body>

<div class="w3-main" style="margin-left:100px;margin-top: 80px;">
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.createuser.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" onsubmit="return !!(validateEmailByRegex() & validatePasswordByRegex());" action="createUser" method="POST" id="registerForm" autocomplete="off">
                    <div class="form-group">
                        <label for="role">${message(code: 'springSecurity.register.role')}</label>
                        <g:select class="form-control" name="roleid" id="role"
                                  from="${com.grailsapplication.Role.list()}"
                                  optionKey="id"/>
                    </div>

                    <div class="form-group">
                        <label for="firstname">*${message(code: 'springSecurity.register.firstname.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.firstname.label')}"
                               class="form-control" name="firstname"
                               id="firstname" value="${firstName}"
                               autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="lastname">${message(code: 'springSecurity.register.lastname.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.lastname.label')}"
                               class="form-control" name="lastname"
                               id="lastname" value="${lastName}"
                               autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <label for="email">*${message(code: 'springSecurity.register.email.label')}</label>
                        <td align="left"><span id="isE"></span>
                            <input type="text" placeholder="${message(code: 'springSecurity.register.email.label')}"
                                   class="form-control" name="email"
                                   id="email" data-toggle="tooltip" data-placement="right" title="abc@example.com"
                                   autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label for="mobilenumber">${message(code: 'springSecurity.register.mobilenumber.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.register.mobilenumber.label')}"
                               class="form-control" name="mobilenumber"
                               id="mobilenumber" value="${mobileNumber}"
                               autocapitalize="none"/>
                    </div>


                    <div class="form-group">
                        <label for="username">*${message(code: 'springSecurity.login.username.label')}</label>
                        <input type="text" placeholder="${message(code: 'springSecurity.login.username.label')}"
                               class="form-control" name="username"
                               id="username" value="${userName}"
                               autocapitalize="none" required/>
                    </div>

                    <div class="form-group">
                        <label>*${message(code: 'springSecurity.register.sex.label')}</label>
                        <select class="custom-select" name="sex" id="sex" required="required">
                            <option value="${message(code: 'register.sex.male')}"
                                    selected>${message(code: 'register.sex.male')}</option>
                            <option value="${message(code: 'register.sex.female')}">${message(code: 'register.sex.female')}</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="dateofbirth">${message(code: 'springSecurity.register.date.label')}</label>
                        <input type="date" value="2020-05-20" name="dateofbirth" id="dateofbirth" min="2012-01-01"
                               max="2050-12-31">
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
                                       id="password" data-toggle="tooltip" data-placement="right" title=" Minimum 8 and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character" required/>
                            </div>
                    </div>

                    <div class="form-group" id="reenterpassword">
                        <label for="password">*${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" class="form-control" name="confirmpassword" value=""
                               id="confirmpassword" required/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">
                        ${message(code: 'default.add.user.button')}</button>
                    <hr class="my-4">
                </form>
                <g:form controller="userManagement">
                    <button id="cancel" class="btn btn-lg btn-secondary btn-block text-uppercase"
                            type="submit">${message(code: 'default.button.cancel')}</button>
                </g:form>
            </div>
        </div>
    </div>
</div>
</div>
<asset:javascript src="validator.js"/>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function () {
        document.forms['registerForm'].elements['firstname'].focus();
        var checkbox = document.querySelector('input[type="checkbox"]');
        if (checkbox.checked) {
            var pass = document.getElementById('password').value = generatePassword()
            document.getElementById("confirmpassword").setAttribute('value', pass);
            $('#reenterpassword').hide();
        }
        checkbox.addEventListener('change', function () {
            if (checkbox.checked) {
                var pass = document.getElementById('password').value = generatePassword()
                document.getElementById("confirmpassword").setAttribute('value', pass);
                $('#reenterpassword').hide();
            } else {
                document.getElementById("confirmpassword").value = typePassword()
                document.getElementById("password").value = typePassword()
            }
        });
    });
    function generatePassword() {
        var randomstring = Math.random().toString(36).slice(-8).concat('@T2t');
        return randomstring;
    }
    function typePassword() {
        document.getElementById("confirmpassword").setAttribute('value', '');
        $('#password').show()
        $('#reenterpassword').show()
        return null
    }
</g:javascript>
</body>
</html>