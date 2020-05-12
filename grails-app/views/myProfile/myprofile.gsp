<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body onload="setup()">
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main">
    <section class="row">
        <h1><b>${message(code: 'default.myprofile.header')}</b>
        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <g:form controller="changePassword">
            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                    code="default.button.change"></g:message></button>
        </g:form>
    </section>
</div>

<div class="row">
    <div id="shadowbox">
        <div class="center hideform">
            <button id="close" style="float: right;">X</button><br><br>
            <g:form controller="myProfile" action="editUserDetails">
                <b>${message(code: 'default.myprofile.firstname')}</b>
                <input type="text" name="firstname"
                       value="${firstName}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>${message(code: 'default.myprofile.lastname')}</b>
                <input type="text" name="lastname"
                       value="${lastName}">&nbsp;&nbsp;&nbsp;
                <b>${message(code: 'default.myprofile.email')}</b>
                <input type="text" name="email"
                       value="${email}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>${message(code: 'default.myprofile.mobilenumber')}</b>
                <input type="text" name="mobilenumber"
                       value="${mobileNumber}">
                <b>${message(code: 'default.myprofile.username')}</b>
                <input type="text" id="disabled" name="disabledusername"
                       value="${userName}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button id="submit" style="float:right " class=" butn-lg butn-primary butn-blk text-uppercase"
                        type="submit"><g:message
                        code="default.button.ok"></g:message></button>
            </g:form>
        </div>

        <div>
            <b>${message(code: 'default.myprofile.firstname')}</b> ${firstName}<br>
            <b>${message(code: 'default.myprofile.lastname')}</b> ${lastName}<br>
            <b>${message(code: 'default.myprofile.email')}</b> ${email}<br>
            <b>${message(code: 'default.myprofile.mobilenumber')}</b> ${mobileNumber}<br>
            <b>${message(code: 'default.myprofile.username')}</b> ${userName}
        </div>
    </div>
</div>
<button id="show" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
        code="default.button.edit.label"></g:message></button>
<g:form controller="secured">
    <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
            code="default.button.cancel"></g:message></button>
</g:form>
<asset:javascript src="validator.js"/>
</body>
</html>
