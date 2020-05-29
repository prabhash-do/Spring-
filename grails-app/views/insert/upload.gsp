<%--
  Created by IntelliJ IDEA.
  User: skumari04
  Date: 04-05-2020
  Time: 13:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="main.upload.title"/></title>
    <style type="text/css">
    #progressStatus0 {
        width: 0%;
        background-color: #ddd;
    }

    #progressBar0 {
        width: 0%;
        height: 35px;
        background-color: #2196f3;
        text-align: center;
        line-height: 32px;
        color: white;
    }
    .hide{
        display: none;
    }
    #warning_message{
        text-align: center;
        width: 100%;
        height: 35px;
        text-align: center;
        line-height: 32px;
        color: black;
    }
    </style>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='jquery.alerts.js'/>
    <asset:stylesheet src="jquery.alerts.css" />
    <asset:javascript src='sweetalert.min.js'/>
</head>

<body class="w3-light-grey">
<g:if test="${message}">
    <tr align="center">
        <td>
            <script type="text/javascript"> jAlert('${message}')</script>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</g:if>
<sec:ifLoggedIn>
    <!-- Sidebar/menu -->
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5><g:message code="side.bar.index.head.title"/></h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 15px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i><g:message
                    code="side.bar.index.overview.title"/>
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding w3-indigo"><i class="fa fa-upload fa-fw"></i><g:message
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
            <a id="settings" name="settings" href="<g:createLink controller='settings' action='doSettings'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-cogs fa-fw"></i><g:message code="side.bar.index.settings.title"/></a>
            <a id="changePassword" name="changePassword" href="<g:createLink controller='userManagement' action='change'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-edit"></i><g:message code="default.button.change"/></a>

        </div>
    </nav>
</sec:ifLoggedIn>
<section id="services">
    <div class="container" style="margin-left:300px;margin-top: 140px;">
        <h5 id="warning_message"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
            Please set maximum file size from settings menu, after that you can upload a file.</h5>
        <g:render template="/templates/grailstemplates"/>
        <g:form controller="Upload" action="doUpload" method="POST" enctype="multipart/form-data">
            <div class="row space-rows" id="animated-cards">
                <div class="col">
                    <div class="card cards-shadown cards-hover">
                        <div class="card-header"><span class="space"><i class="fab fa-angular service-icon" id="service-icon-1"></i></span>
                            <div class="cardheader-text">
                                <p id="cardheader-subtext-1" class="cardheader-subtext"><g:message
                code="upload.choose.file.message"/></p>

            <g:hiddenField name="maxFileSize" id="maxFileSize" value="${fileSize1}"/>

            <input type="file" name="file" id="file0" multiple>

            <div id="progressStatus0">
                <div id="progressBar0"></div>
            </div>

            </div>
        </div>

            <input type="submit" id="submit0" value="${message(code: 'default.upload.label', default: 'Upload')}"
                   disabled="disabled"
                   onclick="return savefname0()"/></span>
                </div>
            </div>

        </g:form>
    </div>

        <g:javascript>

            $(document).ready(function() {
             var maxfilesize = $('#maxFileSize').val();
             if(maxfilesize == ""){
                 document.getElementById("file0").disabled = true;
             }else {
                 $("#warning_message").addClass("hide")
             }
            });


        function savefname0() {
            var filename = $('#file0').val();
            var maxfilesize = $('#maxFileSize').val();
            if (filename != null && filename !== '') {
                 var fi = document.getElementById('file0');
                // Check if any file is selected.
                 if (fi.files.length > 0) {
                     for (var i = 0; i <= fi.files.length - 1; i++) {
                        var fsize = fi.files.item(i).size;
                        var file = fsize / 1024/1024;
                        // The size of the file.
                        if (file >= maxfilesize) {
                            alert(
                                "File is large, please select a file less than "+maxfilesize+"MB");
                        }
                        else {
                            updateProgressBar0();
                            return true;
                        }
                     }
                 }
            } else {
                alert("${message(code: 'upload.choose.file.message')}");
                return false;
            }
        }

        function updateProgressBar0() {
            var progressBar = document.getElementById("progressBar0");
            var progressStatus = document.getElementById("progressStatus0");
            progressStatus.style.width = "auto";
            var width = 1;
            var identity = setInterval(scene, 10);

            function scene() {
                if (width >= 100) {
                    $('#submit0').prop('disabled', false);
                    clearInterval(identity);
                    progressBar.hidden = true;
                    progressStatus.hidden = true;
                } else {
                    $('#submit0').prop('disabled', true);
                    width++;
                    progressBar.style.width = width + '%';
                    progressBar.innerHTML = width  + '%';
                }
            }
        }
        </g:javascript>
    </div>
    <script type="text/javascript">
        $('#file0').change(function () {
            $('#submit0').removeAttr('disabled')
        })


        function deleteAllFile() {
            swal({
                // options...
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover files!",
                icon: "warning",
                buttons:true,
                dangerMode: true,
                closeonConfirm: false
            }).then(function(isConfirm) {
                if ( isConfirm) {
                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller: 'deleteAll' ,action: 'doAllDelete')}',
                        success: function () {
                            swal('Deleted!', 'All File deleted', 'success');
                            location.reload()
                        }
                    });
                }
                else {
                    swal('Cancelled',
                        'Your file is safe :)',
                        'error'
                    );
                }

            });
        }
    </script>

</section>

</body>
</html>
