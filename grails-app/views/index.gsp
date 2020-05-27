<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
    .delete_test {
        float: right;
        margin-right: 3em;
        text-align: center;
    }

    .file-preview {
        background: #fdf8ff;
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
    <title><g:message code="main.index.my.dashboard.title"/></title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
</head>
<title><g:message code="main.title"/></title>
<meta charset="UTF-8">
<style>
html, body, h1, h2, h3, h4, h5 {
    font-family: "Raleway", sans-serif
}
</style>

<body class="w3-light-grey">
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <hr>

    <div class="w3-container" style="margin-top: 100px;">
        <h5><g:message code="side.bar.index.head.title"/></h5>
    </div>

    <div class="w3-bar-block" style="margin-top: 15px;">
        <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
           class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-eye fa-fw"></i><g:message
                code="side.bar.index.overview.title"/>
        </a>
        <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-upload fa-fw"></i><g:message
                code="side.bar.index.upload.title"/></a>
        <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
           class="w3-bar-item w3-button w3-padding"><i
                class="fa fa-users fa-fw"></i><g:message code="side.bar.index.list.user.title"/></a>
        <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
           class="w3-bar-item w3-button w3-padding"><i class="fa fa-trash fa-fw"></i><g:message
                code="side.bar.index.delete.all.files.title"/></a>

    </div>
</nav>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top: 100px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i><g:message code="main.index.my.dashboard.title"/></b></h5>
    </header>

    <div class="w3-row-padding w3-margin-bottom">
        <g:form id="all" name="all" controller="listing" action="doListing">
            <div class="w3-quarter" onclick="submitAll()">
                <div class="w3-container w3-cyan w3-padding-16">
                    <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>

                    <div class="w3-right" id="all">
                    </div>

                    <div class="w3-clear"></div>
                    <h4><g:message code="main.index.box.all.files.title"/></h4>
                </div>
            </div>
        </g:form>
        <g:form id="documents" name="documents" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="documents"/>
            <div class="w3-quarter" onclick="submitDoc()">
                <div class="w3-container w3-red w3-padding-16">
                    <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>

                    <div class="w3-right" id="documents">
                    </div>

                    <div class="w3-clear"></div>
                    <h4><g:message code="main.index.box.document.title"/></h4>
                </div>
            </div>
        </g:form>
        <g:form id="images" name="images" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="images"/>
            <div class="w3-quarter" onclick="submitImages()">
                <div class="w3-container w3-blue w3-padding-16">
                    <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>

                    <div class="w3-right" id="images">
                    </div>

                    <div class="w3-clear"></div>
                    <h4><g:message code="main.index.box.images.title"/></h4>
                </div>
            </div>
        </g:form>
        <g:form id="ppts" name="ppts" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="ppts"/>
            <div class="w3-quarter" onclick="submitPpts()">
                <div class="w3-container w3-teal w3-padding-16">
                    <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>

                    <div class="w3-right" id="ppts">
                    </div>

                    <div class="w3-clear"></div>
                    <h4><g:message code="main.index.box.ppt.title"/></h4>
                </div>
            </div>
        </g:form>
        <g:form id="videos" name="videos" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="videos"/>
            <div class="w3-quarter" onclick="submitVideos()">
                <div class="w3-container w3-orange w3-text-white w3-padding-16">
                    <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>

                    <div class="w3-right" id="videos">
                    </div>

                    <div class="w3-clear"></div>
                    <h4><g:message code="main.index.box.video.title"/></h4>
                </div>
            </div>
        </g:form>
        <div class="w3-panel">
            <div class="w3-panel" style="margin-left: 422px;">
                <g:form controller="search" action="list" method="post">
                    <g:textField id="searchtext" class="input-xxlarge" name="srch"
                                 placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
                    <button id="submit-values" class="buttons" type="submit">
                        <i class="icon-ok"></i>
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </g:form>
            </div>


        <table class="table table-bordered">
            <thead>
            <tr>
                <th><b><g:message code="main.file.list.file.name.head"/></b></th>
                <th><b><g:message code="main.file.list.file.size.head"/></b></th>
                <th><b><g:message code="main.file.list.creation.date.head"/></b></th>
                <th><b><g:message code="main.file.list.preview.head"/></b></th>
                <th><b><g:message code="main.file.list.action.icon.head"/></b></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${dblist}">
                <tr>
                    <td><h5>${it.fileName}</h5></td>
                    <td>${it.fileSize}</td>
                    <td>${it.creationDate}</td>
                    <td><g:if
                            test="${it.fileName.toLowerCase().contains(".mp4") || it.fileName.toLowerCase().contains(".mov") || it.fileName.toLowerCase().contains(".3gp") || it.fileName.toLowerCase().contains(".avi") || it.fileName.toLowerCase().contains(".mpg") || it.fileName.toLowerCase().contains(".ogg") || it.fileName.toLowerCase().contains(".webm")}">
                        <div class="file-preview">
                            <a href="${resource(dir: 'upload/videos', file: it.fileName)}"/>
                            <video style="height: 50px ; width: 50px"
                                   src="${resource(dir: 'upload/videos', file: it.fileName)}" alt="Video" loop
                                   preload="auto"/>
                        </div>
                    </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".png") || it.fileName.toLowerCase().contains(".jpg") || it.fileName.toLowerCase().contains(".jpeg")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload/images', file: it.fileName)}"/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'upload/images', file: it.fileName)}" alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".pdf")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview"
                                                       params="[filename: it.fileName]"/>'/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'images', file: 'pdf.png')}" alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".txt")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview"
                                                       params="[filename: it.fileName]"/>'/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'images', file: 'txt.png')}" alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".docx")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload', file: it.fileName)}" download/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'images', file: 'docx.png')}" alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".xlsx") || it.fileName.toLowerCase().contains(".xls") || it.fileName.toLowerCase().contains(".csv")}">
                            <div class="file-preview">
                                <a href="${resource(dir: 'upload', file: it.fileName)}" download/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'images', file: 'xls.jpg')}" alt="Image"/>
                            </div>
                        </g:if>
                        <g:if test="${it.fileName.toLowerCase().contains(".pptx") || it.fileName.toLowerCase().contains(".ppt")}">
                            <div class="file-preview">
                                <a href='<g:createLink controller="preview" action="preview"
                                                       params="[filename: it.fileName]"/>'/>
                                <img style="height:50px ;width:50px"
                                     src="${resource(dir: 'images', file: 'pptx.png')}" alt="Image"/>
                            </div>
                        </g:if></td>
                    <td><div class="delete_test">
                        <g:link controller="delete" action="doDelete" params="[filename: it.fileName]"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i
                                class="fa fa-trash fa-2x" aria-hidden="true" title="<g:message
                                        code="default.delete.label"/>"></i></g:link>
                    </div></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="w3-panel">
        %{--        Do Listing of all files here--}%

        </div>
    </div>
    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey">
        <div class="footer row" role="contentinfo">
            <p><g:message code="default.index.footer.message"></g:message></p>
        </div>
    </footer>
    <!-- End page content -->


    <script>

        function submitAll() {
            document.forms['all'].submit()
        }

        function submitDoc() {
            document.forms['documents'].submit()

        }

        function submitImages() {
            document.forms['images'].submit()

        }

        function submitVideos() {
            document.forms['videos'].submit()

        }

        function submitPpts() {
            document.forms['ppts'].submit()

        }

    </script>
</div>
</body>
</html>