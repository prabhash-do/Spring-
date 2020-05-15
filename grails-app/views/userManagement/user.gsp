<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
</head>

<body onload="setup()">

<g:render template="/templates/grailstemplates"/>
<g:form controller="createUser">
    <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
            code="default.button.createuser"></g:message></button>
</g:form>
<g:each in="${currentuser}" var="CUser">
    <ul>
        <fieldset class="message">
            <table>
                <tr>
                    <td>${CUser.firstname}  ${CUser.lastname}</td>
                </tr>
            </table>
        </fieldset>
    </ul>
</g:each>
    <g:each in="${listuser}" var="User">
        <ul>
            <fieldset class="message">
                <table>
                    <tr>
                        <td>${User.firstname}  ${User.lastname}</td>
                       <td> <g:form controller="resetPassword" action="index" params="[username:User.username]">
                            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                                    code="default.button.reset"></g:message></button>
                        </g:form></td>
                       <td> <g:form controller="delete" action="userdelete"  params="[userid: User.id]">
                            <button id="submit" class="butn butn-lg butn-primary butn-blk text-uppercase" type="submit"><g:message
                                    code="default.button.deleteuser"></g:message></button></td>
                        </g:form>
                    </tr>
                </table>
            </fieldset>
        </ul>
    </g:each>

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
