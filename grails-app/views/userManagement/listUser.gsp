<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <content tag="menu.item"><g:message code="side.bar.index.list.user.title"/></content>
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
<g:render template="/templates/grailstemplates"/>
<div id="main-heading" role="main" style="margin-left:300px;margin-top:100px;">

    <header class="w3-container" style="padding-top:22px">
        <h1><b><i class="fa fa-user"></i>&nbsp;<g:message code="default.user.header"/></b></h1>
        <hr class="my-4"/>
    </header>
    <div class="w3-panel" style="margin-left:5px;">
        <g:form controller="userManagement" action="searchUser" method="post">
            <g:textField id="searchtext" class="input-xxlarge" name="srch"
                         placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
            <button id="submit-values" class="buttons" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </g:form>
    </div>
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
                        <td><g:form controller="userManagement" action="reset">
                            <g:hiddenField name="username" id="username" value="${User.username}" />
                            <button id="submit" class="btn btn-primary text-uppercase "
                                    type="submit">${message(code: 'default.button.reset')}</button>
                        </g:form></td>
                        <td>
                            <button id="submit1" onclick="deleteUser('${User.id}')"
                                    class="btn btn-primary text-uppercase "
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
            buttons: true,
            dangerMode: true,
            closeonConfirm: false
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'POST',
                    url: '${createLink(controller: 'deleteAll' ,action: 'doAllDelete')}',
                    success: function () {
                        swal('Deleted!', 'All File deleted', 'success');
                        location.reload()
                    }
                });
            } else {
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
