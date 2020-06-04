<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 21-05-2020
  Time: 02:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <content tag="menu.item"><g:message code="side.bar.index.email.title"/></content>
    <meta name="layout" content="main"/>
    <title><g:message code="main.email.title"/></title>
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
            <h1><b><i class="fa fa-envelope fa-fw"></i>&nbsp;<g:message code="main.title.email"/></b></h1>
            <hr class="my-4"/>
        </header>
        <g:form class="setting-page" controller="settings" action="doMail" method="POST"
                id="sms-page"
                autocomplete="off">
            <div class="form-group" style="margin-left: 20px">
                <g:render template="/templates/grailstemplates"/>
                <label for="mail"><h1><g:message code="Mail.id.dummy.email"/></h1></label>
                <td align="left">

                    <div class="input-group mb-2 mr-sm-2">
                        <input type="email" placeholder="<g:message code="Mail.place.holder"/>"
                               class="form-control" name="mail"
                               id="mail"
                               autocapitalize="none" required/>
                    </div>
                </td>
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
</body>
</html>