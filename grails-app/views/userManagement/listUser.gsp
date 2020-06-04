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
                        <td>
                            <div class="dropdown">
                                <button class="dropbtn" style="margin-left: 111px"><i class="fa fa-ellipsis-h"
                                                                                      style="color: indigo"></i>
                                </button>

                                <div class="dropdown-content" >
                                    <g:form controller="userManagement" action="reset">
                                        <g:hiddenField name="username" id="username" value="${User.username}"/>
                                        <button id="resetSubmit" class="btn"
                                                type="submit">${message(code: 'default.button.reset')}</button>
                                    </g:form>
                                    <g:form controller="userManagement" action="editUser">
                                        <g:hiddenField name="username" id="username" value="${User.username}"/>
                                        <button id="editSubmit" class="btn"
                                                type="submit">${message(code: 'default.button.edituser')}</button>
                                    </g:form>
                                    <button id="deleteSubmit" class="btn" style="margin-left: 24px"
                                            onclick="deleteUser('${User.id}')"
                                            type="submit">${message(code: 'default.button.deleteuser')}</button>
                                </div>
                            </div>
                        </td>
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
            closeOnClickOutside:false,
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
                            closeOnClickOutside:false,
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


</script>
</body>
</html>
