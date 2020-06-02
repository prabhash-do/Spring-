<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
</head>

<body onload="setup()">
<g:render template="/templates/grailstemplates"/>
<div class="container" style="margin-left:300px;margin-top: 100px;">
    <header class="w3-container" style="padding-top:22px">
        <h1><b><i class="fa fa-user" style="color: cornflowerblue;"></i><b style="color: cornflowerblue;font: inherit; font-size: 23px;"> ${firstName}</b></b></h1>
        <p><h6 style="font-size: 12px; color: black;">${message(code: 'default.header.user')}: ${userId}</h6></p>
        <hr class="my-4"/>
    </header>

    <div class="w3-container w3-white w3-padding-32" style="margin-top: 10px;">
        <div class="w3-row">
            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.firstname')}</h4>

                <p>${firstName}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.lastname')}</h4>

                <p>${lastName}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.email')}</h4>

                <p>${email}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.mobilenumber')}</h4>

                <p>${mobileNumber}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.sex')}</h4>

                <p>${sex}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.dateofbirth')}</h4>

                <p>${dateOfBirth}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.username')}</h4>

                <p>${userName}</p>
            </div>

            <div class="w3-container w3-third">
                <h4 class="w3-bottombar w3-white w3-border-gray">${message(code: 'default.myprofile.username.role')}</h4>

                <p>${role}</p>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-primary text-uppercase " data-toggle="modal"
                    data-target=".bd-example-modal-lg"><g:message
                    code="default.button.edit.label"></g:message></button>
            <g:form controller="userManagement">
                <button id="submit" class="btn btn-secondary text-uppercase" type="submit"><g:message
                        code="default.button.cancel"></g:message></button>
            </g:form>
        </div>
    </div>
</div>

<div class="row">
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <g:form controller="userManagement" action="editUserDetails" params="[username: userName]">
                    <div class="modal-header">
                        <h5 class="modal-title"
                            id="exampleModalCenterTitle">${message(code: 'default.myprofile.dialog.title')}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label for="role">${message(code: 'springSecurity.register.role')}</label>
                            <g:select class="form-control" name="roleid" id="role"
                                      from="${com.grailsapplication.Role.list()}"
                                      optionKey="id"/>
                        </div>

                        <div class="form-group">
                            <label for="firstname"
                                   class="col-form-label">${message(code: 'default.myprofile.firstname')}</label>
                            <input type="text" class="form-control" id="firstname" name="firstname"
                                   value="${firstName}">
                        </div>

                        <div class="form-group">
                            <label for="lastname"
                                   class="col-form-label">${message(code: 'default.myprofile.lastname')}</label>
                            <input type="text" class="form-control" id="lastname" name="lastname"
                                   value="${lastName}">
                        </div>

                        <div class="form-group">
                            <label for="email"
                                   class="col-form-label">${message(code: 'default.myprofile.email')}</label>
                            <input type="text" class="form-control" id="email" name="email" value="${email}">
                        </div>

                        <div class="form-group">
                            <label for="mobilenumber">${message(code: 'springSecurity.register.mobilenumber.label')}</label>
                            <input type="text"
                                   placeholder="${message(code: 'springSecurity.register.mobilenumber.label')}"
                                   class="form-control" name="mobilenumber" value="${mobileNumber}"
                                   id="mobilenumber" maxlength="10" onkeypress="return isNumberKey1(event)"
                                   autocapitalize="none"/>
                        </div>

                        <div class="form-group">
                            <label>${message(code: 'default.myprofile.sex')}</label>
                            <select class="custom-select" name="sex" id="sex" required="required" value="${sex}" selected>
                                <option value="${message(code: 'register.sex.female')}">${message(code: 'register.sex.female')}</option></option>
                                <option value="${message(code: 'register.sex.male')}">${message(code: 'register.sex.male')}</option>
                                <option value="${message(code: 'register.sex.others')}">${message(code: 'register.sex.others')}</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="dateofbirth"
                                   class="col-form-label">${message(code: 'default.myprofile.dateofbirth')}</label>
                            <input type="text" class="form-control" id="dateofbirth" name="dateofbirth"
                                   value="${dateOfBirth}">
                        </div>

                        <div class="form-group">
                            <label for="disabled"
                                   class="col-form-label">${message(code: 'default.myprofile.username')}</label>
                            <input type="text" class="form-control" id="disabled" name="username"
                                   value="${userName}">
                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary text-uppercase"
                                data-dismiss="modal">${message(code: 'default.myprofile.dialog.close')}</button>
                        <button type="submit"
                                class="btn btn-primary text-uppercase">${message(code: 'default.myprofile.dialog.save')}</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="validator.js"/>
<g:javascript>
    document.getElementById("disabled").disabled = true;
</g:javascript>
</body>
</html>