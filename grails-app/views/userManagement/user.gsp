<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
</head>

<body onload="setup()">

<div id="main-heading" role="main">
    <section class="row">
        <h1><b>${message(code: 'default.listuser.header')}</b>
        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <g:form controller="register">
            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                    code="default.button.createuser"></g:message></button>
        </g:form>
        <g:form controller="resetPassword">
            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                    code="default.button.reset"></g:message></button>
        </g:form>
        <g:form controller="delete">
            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                    code="default.button.deleteuser"></g:message></button>
        </g:form>
    </section>
</div>

%{--<div id="myDIV" class="shadowbox" role="main">--}%

%{--    <div class="row">--}%
%{--        <g:form controller="myProfile" action="editUserDetails">--}%
%{--            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message--}%
%{--                    code="default.button.edit.user"></g:message></button>--}%
%{--        </g:form>--}%
%{--    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--}%
%{--        <g:form controller="secured">--}%
%{--            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message--}%
%{--                    code="default.button.cancel"></g:message></button>--}%

%{--        </g:form>--}%
%{--    </div>--}%
%{--</div>--}%
</body>
</html>
