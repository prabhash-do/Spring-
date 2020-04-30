<%--
  Created by IntelliJ IDEA.
  User: TDutta01
  Date: 04-12-2019
  Time: 12:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="home" controller="upload" action="index"><g:message code="default.home.label"/></g:link></li>
        <li><g:link controller="listing" class="list" action="index"><g:message code="default.list.label" args="['Room']" /></g:link></li>
        <li><g:link controller="delete" class="list" action="index"><g:message code="default.list.label" args="['Extra']" /></g:link></li>
    </ul>
</div>