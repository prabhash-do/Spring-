<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'springSecurity.createuser.title')}</title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='jquery.alerts.js'/>
    <asset:stylesheet src="jquery.alerts.css"/>

    <style>
    .card{
        width:120%;

    }
    </style>

</head>
<asset:javascript src='jquery-3.3.1.min.js'/>
<asset:javascript src='jquery.alerts.js'/>
<asset:stylesheet src="jquery.alerts.css" />
<body>
<g:if test="${message}">
    <tr align="center">
        <td>
            <script type="text/javascript"> jAlert('${message}')</script>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</g:if>
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5><g:message code="side.bar.index.head.title"/></h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i><g:message
                    code="side.bar.index.overview.title"/>
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-upload fa-fw"></i><g:message
                    code="side.bar.index.upload.title"/></a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
            <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
               class="w3-bar-item w3-button w3-padding w3-indigo"><i class="fa fa-user fa-fw"></i><g:message
                    code="default.button.createuser"/></a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                    code="side.bar.index.delete.all.files.title"/></a>
            <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
            <a id="changePassword" name="changePassword" href="<g:createLink controller='userManagement' action='change'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-edit"></i><g:message code="default.button.change"/></a>
        </div>
    </nav>
</sec:ifLoggedIn>
<div class="w3-main" style="margin-left:180px;margin-top: 80px;">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">${message(code: 'springSecurity.createuser.header')}</h5>
                    <g:render template="/templates/grailstemplates"/>
                    <form class="form-signin" onsubmit="return !!(validateEmailByRegex() & checkPassword());"
                          action="createUser" method="POST" id="registerForm" autocomplete="off">
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
                                   class="form-control" name="mobilenumber"
                                   id="mobilenumber" minlength="10" onkeypress="return isNumberKey1(event)"
                                   autocapitalize="none"/>
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
                            <input type="date" value="2020-05-20" name="dateofbirth" id="dateofbirth" min="1990-01-01"
                                   max="2025-12-31">
                        </div>


                        <div class="form-group">
                            <label for="password">*${message(code: 'springSecurity.autogenerated.password.label')}</label>
                            <td align="left"><span id="isP"></span>
                            <label class="switch">
                                <input type="checkbox" id="checkbox" checked>
                                <span class="slider round"></span>
                            </label>

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
</body>
</html>