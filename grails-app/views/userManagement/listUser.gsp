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
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>" class="w3-bar-item w3-button w3-padding w3-blue"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding" ><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main" style="margin-left:300px;margin-top: 100px;">
    <section class="row" style="margin-left:-30px;margin-top: 100px;">
        <h1><b>${message(code: 'default.user.header')}</b>
        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </section>
        <g:form controller="userManagement" action="create">
            <button id="submit" class="btn btn-primary margin text-uppercase " type="submit">${message(code: 'default.button.createuser')}</button>
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
                    <td>${User.username}</td>
                    <td><g:form controller="userManagement" action="reset" params="[username: User.username]">
                        <button id="submit" class="btn btn-primary text-uppercase "
                                type="submit">${message(code: 'default.button.reset')}</button>
                    </g:form></td>
                <td><g:form controller="userManagement" action="deleteUser"  params="[userid: User.id]">
                    <button id="submit" class="btn btn-primary text-uppercase " onclick="ondelete()"
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
