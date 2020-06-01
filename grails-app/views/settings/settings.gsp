<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 21-05-2020
  Time: 02:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <content tag="menu.item"><g:message code="side.bar.index.settings.title"/></content>
    <meta name="layout" content="main"/>
    <title><g:message code="main.settings.title"/></title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='sweetalert.min.js'/>
</head>

<body>
<g:if test="${message}">
    <asset:javascript src='jquery.alerts.js'/>
    <asset:stylesheet src="jquery.alerts.css" />
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
<section id="services">
    <div class="container" style="margin-left:280px;margin-top: 100px;">
        <header class="w3-container" style="padding-top:22px">
            <h1><b><i class="fa fa-cogs"></i>&nbsp;<g:message code="main.title.settings"/></b></h1>
            <hr class="my-4"/>
        </header>
        <g:form class="setting-page" controller="settings" action="doSubmitSettings" method="POST" id="setting-page"
                autocomplete="off">
            <div class="form-group" style="margin-left: 20px">
                <label for="propertyValue"><h1><g:message code="settings.max.size.file"/></h1></label>
                <input type="text" value="${fileSize1}" placeholder="<g:message code="placeholder.file.size"/>" class="form-control" name="propertyValue"
                       id="propertyValue" onkeypress="return isNumberKey(event)" maxlength="4"
                       autocapitalize="none" required/>
                <br>
                <button id="submit" type="submit"><g:message code="settings.submit.button"/></button>
            </div>

        </g:form>
    </div>
</section>

<script type="text/javascript">

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

<script>
    function isNumberKey(evt){
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if (charCode > 31 && (charCode != 46 &&(charCode < 48 || charCode > 57)))
            return false;
        return true;
    }
</script>
</body>
</html>
