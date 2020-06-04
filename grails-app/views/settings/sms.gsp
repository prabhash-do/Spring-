<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 21-05-2020
  Time: 02:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <content tag="menu.item"><g:message code="side.bar.index.sms.title"/></content>
    <meta name="layout" content="main"/>
    <title><g:message code="main.sms.title"/></title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='sweetalert.min.js'/>

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
<section id="services">
    <div class="container" style="margin-left:280px;margin-top: 100px;">
        <header class="w3-container" style="padding-top:22px">
            <h1><b><i class="fa fa-commenting fa-fw"></i>&nbsp;<g:message code="main.title.sms"/></b></h1>
            <hr class="my-4"/>
        </header>
        <g:form class="setting-page" controller="settings" action="doSMS" method="POST"
                id="sms-page"
                autocomplete="off">
            <div class="form-group" style="margin-left: 20px">
                <g:render template="/templates/grailstemplates"/>
                <label for="mobilenumber"><h1><g:message code="phone.number.dummy.sms"/></h1>
                </label>
                <input type="text" value="${mobilenumber}" placeholder="<g:message code="phone.number.place.holder"/>"
                       class="form-control" name="mobilenumber"
                       id="mobilenumber" maxlength="10" onkeypress="return isNumberKey1(event)"
                       autocapitalize="none" required/>
                <br>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary text-uppercase " data-toggle="modal" id="submit"
                            data-target=".bd-example-modal-lg">${message(code: 'settings.submit.button')}</button>
                    <g:form controller="secured">
                        <button id="cancel" class="btn btn-secondary text-uppercase"
                                type="submit">${message(code: 'default.button.cancel')}</button>
                    </g:form>
                </div>
            </div>
        </g:form>
    </div>
</section>
<asset:javascript src="validator.js"/>
</body>
</html>