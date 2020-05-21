<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
</head>

<body onload="setup()">
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>" class="w3-bar-item w3-button w3-padding" ><i class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert' />"
               class="w3-bar-item w3-button w3-padding" ><i class="fa fa-eye fa-fw"></i>  Upload</a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>" class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding" ><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main" style="margin-left:300px;margin-top: 100px;">
    <section class="row">
        <h1><b>${message(code: 'default.myprofile.header')}</b>
        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <g:form controller="userManagement" action="change">
            <button id="submit" class="btn btn-primary margin text-uppercase " type="submit"><g:message
                    code="default.button.change"></g:message></button>
        </g:form>
    </section>

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

    <div class="container">
        <div>
            <b>${message(code: 'default.myprofile.firstname')}</b> ${firstName}<br>
            <b>${message(code: 'default.myprofile.lastname')}</b> ${lastName}<br>
            <b>${message(code: 'default.myprofile.email')}</b> ${email}<br>
            <b>${message(code: 'default.myprofile.mobilenumber')}</b> ${mobileNumber}<br>
            <b>${message(code: 'default.myprofile.username')}</b> ${userName}<br>
            <b>${message(code: 'default.myprofile.sex')}</b> ${sex}<br>
            <b>${message(code: 'default.myprofile.dateofbirth')}</b> ${dateOfBirth}
        </div>
        <br>
        <br>
        <div>
            <button type="button" class="btn btn-primary text-uppercase " data-toggle="modal"
                    data-target=".bd-example-modal-lg"><g:message
                    code="default.button.edit.label"></g:message></button>
            <br>
            <br>
            <g:form controller="secured">
                <button id="submit" class="btn btn-secondary text-uppercase" type="submit"><g:message
                        code="default.button.cancel"></g:message></button>
            </g:form>
        </div>
    </div>
</div>
<g:javascript>
    document.getElementById("disabled").disabled = true;
</g:javascript>
</body>
</html>
