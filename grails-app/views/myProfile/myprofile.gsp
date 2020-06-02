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
        <h1><b><i class="fa fa-user"></i>&nbsp;<g:message code="default.myprofile.header"/></b></h1>
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
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-primary text-uppercase " data-toggle="modal"
                    data-target=".bd-example-modal-lg"><g:message
                    code="default.button.edit.label"></g:message></button>
            <g:form controller="secured">
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
                <g:form controller="myProfile" action="editUserDetails">
                    <div class="modal-header">
                        <h5 class="modal-title"
                            id="exampleModalCenterTitle">${message(code: 'default.myprofile.dialog.title')}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
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
                            <label for="mobilenumber"
                                   class="col-form-label">${message(code: 'default.myprofile.mobilenumber')}</label>
                            <input type="text" class="form-control" id="mobilenumber" name="mobilenumber"
                                   value="${mobileNumber}">
                        </div>

                        <div class="form-group">
                            <label for="sex"
                                   class="col-form-label">${message(code: 'default.myprofile.sex')}</label>
                            <input type="text" class="form-control" id="sex" name="sex"
                                   value="${sex}">
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
<g:javascript>
    document.getElementById("disabled").disabled = true;
</g:javascript>
</body>
</html>