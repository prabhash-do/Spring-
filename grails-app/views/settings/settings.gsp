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

    <style>
    .submit {
        float: right;
    }

    .div_checkbox {
        display: block;
    }
    </style>
</head>

<body>
<g:if test="${message}">
    <asset:javascript src='jquery.alerts.js'/>
    <asset:stylesheet src="jquery.alerts.css"/>
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
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
            <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i><g:message
                    code="default.button.createuser"/></a>
            <a id="delete" name="delete" onclick="deleteAllFile()" href="#"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                    code="side.bar.index.delete.all.files.title"/></a>
            <a id="sms" name="sms" href="<g:createLink controller='settings' action='doSms'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-commenting fa-fw"></i><g:message
                    code="side.bar.index.sms.title"/></a>
            <a id="email_id" name="email_id" href="<g:createLink controller='settings' action='doEmail'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw"></i><g:message
                    code="side.bar.index.email.title"/></a>
            <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
               class="w3-bar-item w3-button w3-padding w3-indigo"><i
                    class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
            <a id="changePassword" name="changePassword"
               href="<g:createLink controller='userManagement' action='change'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-edit"></i><g:message code="default.button.change"/></a>
        </div>
    </nav>
</sec:ifLoggedIn>

<section id="services">
    <div class="container" style="margin-left:280px;margin-top: 100px;">
        <header class="w3-container" style="padding-top:22px">
            <h1><b><i class="fa fa-cogs"></i>&nbsp;<g:message code="main.title.settings"/></b></h1>
            <hr class="my-4"/>
        </header>
        <g:form class="setting-page" controller="settings" action="doSubmitSettings" method="POST" id="setting-page"
                autocomplete="off">
            <div class="submit">
                <button id="submit" type="submit"><g:message code="settings.submit.button"/></button>
            </div>
            <div class="form-group" style="margin-left: 20px">
            <label for="propertyValue"><h1><g:message code="settings.max.size.file"/></h1></label>
            <input type="text" value="${fileSize1}" placeholder="<g:message code="placeholder.file.size"/>"
                   class="form-control" name="propertyValue"
                   id="propertyValue" onkeypress="return isNumberKey(event)" maxlength="4"
                   autocapitalize="none" required/>
            <br>

            <h1>Email Settings</h1>

            <div class="div_checkbox">
                <g:checkBox name="email_upload" id="email_upload"></g:checkBox>
                <g:message code="default.email.checkbox.upload" message=""></g:message><br>
                <g:checkBox name="email_delete" id="email_delete"></g:checkBox>
                <g:message code="default.email.checkbox.delete" message=""></g:message><br>
                <g:checkBox name="email_user" id="email_user"></g:checkBox>
                <g:message code="default.email.checkbox.user.creation" message=""></g:message><br>
                <g:checkBox name="email_password" id="email_password"></g:checkBox>
                <g:message code="default.email.checkbox.reset.password" message=""></g:message><br>
            </div>
            <br>

            <h1>Sms Settings</h1>

            <div class="div_checkbox">
                <g:checkBox name="sms_upload" id="sms_upload"></g:checkBox>
                <g:message code="default.sms.checkbox.upload" message=""></g:message><br>
                <g:checkBox name="sms_delete" id="sms_delete"></g:checkBox>
                <g:message code="default.sms.checkbox.delete" message=""></g:message><br>
                <g:checkBox name="sms_user" id="sms_user"></g:checkBox>
                <g:message code="default.sms.checkbox.user.creation" message=""></g:message><br>
                <g:checkBox name="sms_password" id="sms_password"></g:checkBox>
                <g:message code="default.sms.checkbox.reset.password" message=""></g:message><br>
            </div>
            <br>
        </g:form>
        <div class="form-group" style="margin-left: 20px">
            <g:form controller='secured' action='index'>
                <button id="cancel" type="submit">${message(code: 'default.button.cancel')}</button>
            </g:form>
        </div>
    </div>
</section>


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
