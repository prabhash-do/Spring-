<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 21-05-2020
  Time: 02:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>settings</title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='sweetalert.min.js'/>
</head>

<body>
<g:render template="/templates/grailstemplates"/>
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
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
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
            <a id="delete" name="delete" onclick="deleteAllFile()" href="#"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                    code="side.bar.index.delete.all.files.title"/></a>
            <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
               class="w3-bar-item w3-button w3-padding w3-indigo"><i
                    class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
            <a id="changePassword" name="changePassword" href="<g:createLink controller='userManagement' action='change'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-edit"></i><g:message code="side.bar.index.settings.title"/></a>
        </div>
    </nav>
</sec:ifLoggedIn>
<section id="services">
    <div class="container" style="margin-left:300px;margin-top: 140px;">
        <g:form class="setting-page" controller="settings" action="doSubmitSettings" method="POST" id="setting-page"
                autocomplete="off">
            <div class="form-group">
                <label for="propertyValue"><h1>Enter maximum size of file (in MB)</h1></label>
                <input type="text" value="${fileSize1}" placeholder="Filesize in MB" class="form-control" name="propertyValue"
                       id="propertyValue" onkeypress="return isNumberKey(event)" maxlength="4"
                       autocapitalize="none" required/>
            </div>
            <br>
            <button id="submit" type="submit">Submit</button>
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
