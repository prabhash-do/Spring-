<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'perform.file.listing')}</title>
</head>

<body>
<g:render template="/templates/grailstemplates"/>
<div id="content" role="main">
    <content tag="nav">
        <g:link controller="secured">
            <span class="bold-txt" title="${message(code: 'title.home.tooltip')}"><g:message
                    code="default.home.page"></g:message></span>
        </g:link>
    </content>
    <section class="row colset-2-its">
        <h1>${message(code: 'check.remote.files')}</h1>
    </section>
</div>

<div id="design" role="main">
    <g:each in="${remotelist}">
        <ul>
            <li>
                <div class="row">
                    <div class="column" id="thumbnail">
                        ${it}
                        <div class="video" id="videosList">
                            <a href="${resource(dir: 'upload/videos', file: it)}"/>
                            <video style="height: 50px ; width: 50px" src="${resource(dir: 'upload/videos', file: it)}" alt="Video" loop preload="auto"/>
                        </div>
                    </div>

                    <div>
                        <g:link controller="delete" action="doDelete" params="[filename: it]"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message
                                code="default.delete.label"/></g:link>
                        <div>
                            <g:link controller="preview" action="preview" params="[filename: it]"><g:message
                                    code="default.preview.label"/></g:link>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </g:each>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>${message(code: 'check.database.files')}</h1>
    </section>
</div>

<div id="design" role="main">

    <g:if test="${dblist}">
        <g:each in="${dblist}" var="Uploadfile">
            <ul>
                <li>
                    <div class="row">
                        <div class="column">
                            ${Uploadfile.fileName}
                        </div>

                        <div>
                            ${Uploadfile.status}
                        </div>
                    </div>
                </li>
            </ul>
        </g:each>
    </g:if>
</div>
</body>
<g:javascript language="javascript" type="text/javascript">
    function launchPPT(){
        window.location = "Order.pptx";
        startPowerPoint(window.location)
    }

    function startPowerPoint(strFile){
        var myApp = new ActiveXObject("PowerPoint.Application");
        if (myApp != null){
            myApp.Visible = true;
            myApp.Presentations.Open(strFile);
        }
    }
</g:javascript>
</html>