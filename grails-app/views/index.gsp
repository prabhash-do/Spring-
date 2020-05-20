<!DOCTYPE html>
<%@ page import="com.grailsapplication.UploadController" %>

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
        border: 5px solid #1b9ef4;
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
    <title>Dashboard</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<title>Solutionsd</title>
<meta charset="UTF-8">
<style>



html, body, h1, h2, h3, h4, h5 {
    font-family: "Raleway", sans-serif
}
</style>

<body onload="countFile()" class="w3-light-grey">
<body class="w3-light-grey">
<!-- Sidebar/menu -->
<!-- Sidebar/menu -->
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
        </div>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i><g:message code="main.index.my.dashboard.title"/></b></h5>
    </header>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Upload</a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top: 100px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
    </header>

    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-padding-16">
                <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>

                <div class="w3-right">
                    <h3>0</h3>
                </div>

                <div class="w3-clear"></div>
                <h4>Documents</h4>
            </div>
        </div>

        <div class="w3-quarter">
            <div class="w3-container w3-blue w3-padding-16">
                <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>

                <div class="w3-right">
                    <h3>0</h3>
                </div>

                <div class="w3-clear"></div>
                <h4>Images</h4>
            </div>
        </div>

        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16">
                <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>

                <div class="w3-right">
                    <h3>0</h3>
                </div>

                <div class="w3-clear"></div>
                <h4>PPTs</h4>
            </div>
        </div>

        <div class="w3-quarter">
            <div class="w3-container w3-orange w3-text-white w3-padding-16">
                <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>

                <div class="w3-right">
                    <h3>0</h3>
                </div>

                <div class="w3-clear"></div>
                <h4>Videos</h4>
            </div>
        </div>
    </div>

    <div class="w3-panel">

        <g:form controller="search" action="list" method="post">
            <g:textField id="searchtext" class="input-xxlarge" name="srch"
                         placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
            <button id="submit-values" class="buttons" type="submit">
                <i class="icon-ok"></i>
                <i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </g:form>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th><b>Filename</b></th>
                <th><b>Thumbnail</b></th>
                <th><b>Action</b></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${remotelist}">
                <tr>
                    <td><h5>${it}</h5></td>
                    <td><g:if
                            test="${it.contains(".mp4") || it.contains(".mov") || it.contains(".3gp") || it.contains(".avi") || it.contains(".mpg") || it.contains(".ogg") || it.contains(".webm")}">
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
                        </g:if></td>
                    <td><div class="delete_test">
                        <g:link controller="delete" action="doDelete" params="[filename: it]"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i
                                class="fa fa-trash fa-4x" aria-hidden="true" title="<g:message
                                        code="default.delete.label"/>"></i></g:link>
                    </div></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
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
        </div>
    </g:form>
    <div class="w3-panel">
        %{--        Do Listing of all files here--}%

        %{-- <div class="w3-row-padding" style="margin:0 -16px">
             <fieldset class="buttons">
                 <ul>
                     <asset:image src="upload.png"/>
                     <g:link controller='insert' action='insert'><g:message code="default.upload.label"/></g:link>
                     --}%%{--<g:form controller="upload" action="doUpload" method="POST" enctype="multipart/form-data"
                             useToken="true">
                         <span class="button">
                             <asset:image src="select.jpg"/>
                             <input type="file" name="file" id="file"/>

                             <span class="bold-txt" title="${message(code: 'title.email.tooltip')}"><g:message
                                     code="default.email.checkbox"/></span>
                             <g:checkBox name="email" value="${false}"/>

                             <span class="bold-txt" title="${message(code: 'title.sms.tooltip')}"><g:message
                                     code="default.sms.checkbox"/></span>
                             <g:checkBox name="sms" value="${false}"/>

    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey">
        <div class="footer row" role="contentinfo">
            <p><g:message code="default.client.user.role"></g:message></p>
        </div>
    </footer>

    <!-- End page content -->
</div>

<script>
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>
                             <asset:image src="upload.png"/>
                             <input type="submit" value="${message(code: 'default.upload.label', default: 'Upload')}"
                                    onclick="return savefname()"/>
                             <input type="hidden" id="refreshed" value="no">
                         </span>
                     </g:form>--}%%{--
                 </ul>
                 <ul>
                     <asset:image src="list.png"/>
                     <g:link controller='listing' action='doListing'><g:message code="default.list.label"/></g:link>
                 </ul>
                 <ul>
                     <asset:image src="delete.png"/>
                     <g:link controller="deleteAll" action="doAllDelete"
                             onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message
                             code="default.all.delete.label"/>
                     </g:link>
                 </ul>
                 <ul>
                     <asset:image src="users.png"/>
                     <g:link controller="userManagement"><g:message code="default.user.listing.label"/>
                     </g:link>
                 </ul>
             </fieldset>
         </div>--}%
        <div class="w3-panel">
            <a href="<g:createLink controller='listing' action='doListing'/>" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i><g:message code="main.index.label.list.all.files"/></a>

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

<script>
    // Get the Sidebar
    var mySidebar = document.getElementById("mySidebar");

    // Get the DIV with overlay effect
    var overlayBg = document.getElementById("myOverlay");

    // Toggle between showing and hiding the sidebar, and add overlay effect
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }

    function countFile() {
        var image = document.getElementById('images').value = 4
    }

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

</body>
</html>