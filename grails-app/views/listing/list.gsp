<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <style type="text/css">
    .delete_test {
        float: right;
        margin-right: 3em;
    }

    .file-preview {
        background: #ff9892;
        border: 5px solid #fffff7;
        box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        -moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        -webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        display: inline-block;
        float: right;
        margin-right: 3em;
        width: 60px;
        height: 60px;
        text-align: center;
    }

    .row {
        margin-top: 35px;
        margin-bottom: 35px;
    }

    .file-preview:hover {
        -ms-transform: scale(2.5); /* IE 9 */
        -webkit-transform: scale(2.5); /* Safari 3-8 */
        transform: scale(2.5);
    }
    </style>
    <meta name="layout" content="main"/>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <title>${message(code: 'perform.file.listing')}</title>
</head>

<body>
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <hr>
    <div class="w3-container" style="margin-top: 100px;">
        <h5><g:message code="main.index.my.dashboard.title"/></h5>
    </div>

    <div class="w3-bar-block" style="margin-top: 5px;">
        <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
           class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-eye fa-fw"></i><g:message code="side.bar.index.overview.title"/>
        </a>
        <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-upload fa-fw"></i><g:message code="side.bar.index.upload.title"/></a>
        <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
           class="w3-bar-item w3-button w3-padding"><i
                class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
        <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message code="default.all.delete.label"/></a>
        <a id="createuser" name="createuser" href="<g:createLink controller='userManagement' action='create'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw"></i><g:message
                code="default.button.createuser"/></a>
        <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
           class="w3-bar-item w3-button w3-padding"><i
                class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
    </div>
</nav>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-right:20px;margin-top: 40px;">
    <g:form controller="search" action="list" method="post">
        <g:textField id="searchtext" class="input-xxlarge" name="srch" style="margin-top: 100px; margin-left: 100px"
                     placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
        <button id="submit-values" class="buttons" type="submit">
            <i class="fa fa-search" aria-hidden="true"></i>
        </button>
    </g:form>
    <g:form id="home" name="home" controller="secured" action="index">
        <input type="submit" class="w3-bar-item w3-button w3-padding" style="margin-top: -20px; margin-left: 1000px"
               value="Back" onclick="function submit() {
            document.forms['home'].submit()
        }">
    </g:form>
    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-panel" style="margin-left:0px;margin-top: 0px;">
            <div id="design" role="main" style="margin-left:0px;margin-top: 0px;">
                <g:each in="${remotelist}">
                    <ul>
                        <li>
                            <div class="row">
                                <div class="column" id="thumbnail">
                                    ${it}

                                    <g:if test="${it.contains(".mp4") || it.contains(".mov") || it.contains(".3gp") || it.contains(".avi") || it.contains(".mpg") || it.contains(".ogg") || it.contains(".webm")}">
                                        <div class="file-preview">
                                            <a href="${resource(dir: 'upload/videos', file: it)}"/>
                                            <video style="height: 50px ; width: 50px"
                                                   src="${resource(dir: 'upload/videos', file: it)}" alt="Video" loop
                                                   preload="auto"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".png") || it.contains(".jpg") || it.contains(".jpeg")}">
                                        <div class="file-preview">
                                            <a href="${resource(dir: 'upload/images', file: it)}"/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'upload/images', file: it)}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".pdf")}">
                                        <div class="file-preview">
                                            <a href='<g:createLink controller="preview" action="preview"
                                                                   params="[filename: it]"/>'/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'images', file: 'pdf.png')}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".txt")}">
                                        <div class="file-preview">
                                            <a href='<g:createLink controller="preview" action="preview"
                                                                   params="[filename: it]"/>'/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'images', file: 'txt.png')}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".docx")}">
                                        <div class="file-preview">
                                            <a href="${resource(dir: 'upload', file: it)}" download/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'images', file: 'docx.png')}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".xlsx") || it.contains(".xls") || it.contains(".csv")}">
                                        <div class="file-preview">
                                            <a href="${resource(dir: 'upload', file: it)}" download/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'images', file: 'xls.jpg')}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <g:if test="${it.contains(".pptx") || it.contains(".ppt")}">
                                        <div class="file-preview">
                                            <a href='<g:createLink controller="preview" action="preview"
                                                                   params="[filename: it]"/>'/>
                                            <img style="height:50px ;width:50px"
                                                 src="${resource(dir: 'images', file: 'pptx.png')}" alt="Image"/>
                                        </div>
                                    </g:if>
                                    <div class="delete_test">
                                        <g:link controller="delete" action="doDelete" params="[filename: it]"
                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message
                                                code="default.delete.label"/></g:link>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </g:each>
            </div>
        </div>
    </div>
    <hr>
    <hr>
    <hr>
    <hr>
    <br>

    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey">
        <div class="footer row" role="contentinfo">
            <p><g:message code="default.index.footer.message"></g:message></p>
        </div>
    </footer>

    <!-- End page content -->
</div>
</body>
</html>