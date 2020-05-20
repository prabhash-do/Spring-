<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'welcome.utils.tool')}</title>
    <style type="text/css">
    #progressStatus {
        width: 0%;
        background-color: #ddd;
    }
    #progressBar {
        width: 0%;
        height: 35px;
        background-color: #4CAF50;
        text-align: center;
        line-height: 32px;
        color: white;
    }
    </style>
</head>
<title>Solutionsd</title>
<meta charset="UTF-8">
<style>
html, body, h1, h2, h3, h4, h5 {
    font-family: "Raleway", sans-serif
}
</style>

<body class="w3-light-grey">
<!-- Sidebar/menu -->
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>  Upload</a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
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
    <g:form id="all" name="all" controller="listing" action="doListing">
        <div class="w3-quarter" onclick="submitAll()">
            <div class="w3-container w3-cyan w3-padding-16">
                <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>

                <div class="w3-right" id="all">
                </div>

                <div class="w3-clear"></div>
                <h4>All Files</h4>
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
                <h4>Documents</h4>
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
                <h4>Images</h4>
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
                <h4>PPTs</h4>
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
                <h4>Videos</h4>
            </div>
        </div>
        </div>
    </g:form>
    <div class="w3-panel">
        %{--        Do Listing of all files here--}%

    </div>
    <hr>
    <hr>
    <hr>
    <hr>
    <br>
</div>
    <!-- Footer -->
    <footer class="w3-container w3-padding-16 w3-light-grey" style="margin-left:300px;margin-bottom: 0px;">
        <div class="footer row" role="contentinfo">
            <p><g:message code="default.client.user.role"></g:message></p>
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

</body>
</html>
