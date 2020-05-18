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
        border:5px solid #fffff7;
        box-shadow:0 0 4px rgba(0, 0, 0, 0.5);
        -moz-box-shadow:0 0 4px rgba(0, 0, 0, 0.5);
        -webkit-box-shadow:0 0 4px rgba(0, 0, 0, 0.5);
        display:inline-block;
        float:right;
        margin-right:3em;
        width:60px;
        height:60px;
        text-align:center;
    }
    .row{
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
<g:form controller="search" action="list" method="post">
    <g:textField id="searchtext" class="input-xxlarge" name="srch" placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
    <button id="submit-values" class="buttons" type="submit">
        <i class="icon-ok"></i>
        ${message(code: 'default.button.search')}
    </button>
</g:form>
<g:render template="/templates/grailstemplates"/>
<div id="content" role="main">
    <content tag="nav">
        <g:link controller="secured">
            <span class="bold-txt" title="${message(code: 'title.home.tooltip')}"><g:message
                    code="default.home.page"></g:message></span>
        </g:link>
    </content>
</div>

<div id="design" role="main" >
    <g:each in="${remotelist}">

        <ul>
            <li>
                <div class="row">
                    <div class="column" id="thumbnail">
                        ${it}

                        <g:if test="${it.contains(".mp4")||it.contains(".mov")||it.contains(".3gp")||it.contains(".avi")||it.contains(".mpg")||it.contains(".ogg")||it.contains(".webm")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload/videos', file: it)}"/>
                                <video style="height: 50px ; width: 50px" src="${resource(dir: 'upload/videos', file: it)}" alt="Video" loop preload="auto"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".png")||it.contains(".jpg")||it.contains(".jpeg")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload/images', file: it)}"/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'upload/images', file: it)}"  alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".pdf")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview" params="[filename: it]" />'/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'images', file: 'pdf.png')}"  alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".txt")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview" params="[filename: it]" />'/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'images', file: 'txt.png')}"  alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".docx")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload', file: it)}" download/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'images', file: 'docx.png')}"  alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".xlsx")||it.contains(".xls")||it.contains(".csv")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload', file: it)}" download/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'images', file: 'xls.jpg')}"  alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.contains(".pptx")||it.contains(".ppt")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview" params="[filename: it]" />'/>
                                <img style="height:50px ;width:50px" src="${resource(dir: 'images', file: 'pptx.png')}"  alt="Image"/>
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

<div id="content" role="main">

</div>

<div id="design" role="main">


</div>
</body>
</html>
