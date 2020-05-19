<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
</head>

<body onload="setup()">
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main">
    <section class="row">
        <h1><b>${message(code: 'default.user.header')}</b>
        </h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <g:form controller="userManagement" action="create">
            <button id="submit" class="btn btn-primary margin text-uppercase " type="submit">${message(code: 'default.button.createuser')}</button>
        </g:form>
    </section>
</div>
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
                    <td><g:form controller="userManagement" action="reset" params="[username: User.username]">
                        <button id="submit" class="btn btn-primary text-uppercase "
                                type="submit">${message(code: 'default.button.reset')}</button>
                    </g:form></td>
                <td><g:form controller="userManagement" action="userdelete" params="[userid: User.id]">
                    <button id="submit" class="btn btn-primary text-uppercase "
                            type="submit">${message(code: 'default.button.deleteuser')}</button></td>
                </g:form>
                </tr>
            </table>
        </fieldset>
    </ul>
</g:each>
</body>
</html>
