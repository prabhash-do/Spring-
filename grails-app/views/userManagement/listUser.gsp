<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
        <asset:javascript src='jquery-3.3.1.min.js'/>
        <asset:javascript src='jquery.alerts.js'/>
        <asset:stylesheet src="jquery.alerts.css"/>

</head>

<body onload="setup()">
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
               class="w3-bar-item w3-button w3-padding w3-indigo"><i
                    class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
            <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i><g:message
                    code="default.button.createuser"/></a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                    code="side.bar.index.delete.all.files.title"/></a>
        </div>
    </nav>
</sec:ifLoggedIn>
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main" style="margin-left:300px;margin-top: 140px;">
%{--    <section class="row" style="margin-left:-30px;margin-top: 100px;">--}%
%{--        <h1><b>${message(code: 'default.user.header')}</b>--}%
%{--        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--}%
%{--    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--}%
%{--    </section>--}%
    <g:each in="${currentuser}" var="CUser">
        <ul>
            <fieldset class="message">
                <table>
                    <tr>
                        <td>${CUser.username}</td>
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
                        <td>${User.username}</td>
                        <td><g:form controller="userManagement" action="reset" params="[username: User.username]">
                            <button id="submit" class="btn btn-primary text-uppercase "
                                    type="submit">${message(code: 'default.button.reset')}</button>
                        </g:form></td>
                    <td><g:form controller="userManagement" action="deleteUser" params="[userid: User.id]">
                        <button id="submit1" class="btn btn-primary text-uppercase "
                                type="submit">${message(code: 'default.button.deleteuser')}</button></td>
                    </g:form>
                    </tr>
                </table>
            </fieldset>
        </ul>
    </g:each>
</div>
</body>
</html>
