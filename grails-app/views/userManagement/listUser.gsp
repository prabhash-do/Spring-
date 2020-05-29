<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'default.user.details')}</title>
        <asset:javascript src='jquery-3.3.1.min.js'/>
        <asset:javascript src='jquery.alerts.js'/>
        <asset:stylesheet src="jquery.alerts.css"/>
        <asset:javascript src='sweetalert.min.js'/>

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
            <a id="delete" name="delete" onclick="deleteAllFile()" href="#"
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
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main" style="margin-left:300px;margin-top:100px;">

    <header class="w3-container" style="padding-top:22px">
        <h1><b><i class="fa fa-user"></i>&nbsp;<g:message code="default.user.header"/></b></h1>
        <hr class="my-4"/>
    </header>
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
                    <td>
                        <button id="submit1" onclick="deleteUser('${User.id}')" class="btn btn-primary text-uppercase "
                                type="submit">${message(code: 'default.button.deleteuser')}</button></td>
                    </tr>

                    </tr>
                </table>
            </fieldset>
        </ul>
    </g:each>
</div>

<script>
    function deleteUser(data) {
        swal({
// options...
            title: "Are you sure?",
            text: "Once deleted, user will not be available!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
            closeonConfirm: false
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'POST',
                    data: "userid=" + data,
                    url: '${createLink(controller: 'userManagement' ,action: 'deleteUser')}',
                    success: function (data) {
                        swal({
                            title: "Deleted!",
                            text: "User has been deleted",
                            icon: "success",
                            close: false
                        }).then(function (isConfirm) {
                            if (isConfirm) {
                                location.reload()
                            }
                        })
                    }
            });
    } else {
                swal('Cancelled',
                    'User is safe :)',
                    'error'
                );
            }

        });
    }

    function deleteAllFile() {
        swal({
            // options...
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover files!",
            icon: "warning",
            buttons:true,
            dangerMode: true,
            closeonConfirm: false
        }).then(function(isConfirm) {
            if ( isConfirm) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'deleteAll' ,action: 'doAllDelete')}',
                    success: function () {
                        swal('Deleted!', 'All File deleted', 'success');
                        location.reload()
                    }
                });
            }
            else {
                swal('Cancelled',
                    'Your file is safe :)',
                    'error'
                );
            }

        });
    }


</script>
</body>
</html>
