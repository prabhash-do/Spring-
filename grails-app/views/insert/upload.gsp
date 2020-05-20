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
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <title>Upload Page</title>
    <style type="text/css">
    #progressStatus0 {
        width: 0%;
        background-color: #ddd;
    }

    #progressBar0 {
        width: 0%;
        height: 35px;
        background-color: #4CAF50;
        text-align: center;
        line-height: 32px;
        color: white;
    }
    </style>

</head>

<body onload="setup()">
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>" class="w3-bar-item w3-button w3-padding" ><i class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert' />"
               class="w3-bar-item w3-button w3-padding w3-blue" ><i class="fa fa-eye fa-fw"></i>  Upload</a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>" class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding" ><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>
<section id="services">
    <div class="container" style="margin-left:300px;margin-top: 140px;">
        <g:form controller="Upload" action="doUpload" method="POST" enctype="multipart/form-data">
            <div class="row space-rows" id="animated-cards">
                <div class="col">
                    <div class="card cards-shadown cards-hover">
                        <div class="card-header"><span class="space"><i class="fab fa-angular service-icon" id="service-icon-1"></i></span>
                            <div class="cardheader-text">
                                <p id="cardheader-subtext-1" class="cardheader-subtext">Choose Files</p>

                                    <input type="file" name="file" id="file0" accept="image/*,application/*,audio/*,video/*,.pptx,.jar">
                                    <div id="progressStatus0">
                        <div id="progressBar0"></div>
                    </div>

                            </div>
                        </div>

                        <input type="submit" id="submit0" value="${message(code: 'default.upload.label', default: 'Upload')}" disabled="disabled"
                           onclick="return savefname0()"/></span>
                </div>
            </div>

        </g:form>
    </div>

        <g:javascript>
        function savefname0() {
            var filename = $('#file0').val();
            if (filename != null && filename != '') {
                updateProgressBar0();
                 var fileNameLength = document.getElementById("file0").files[0].name;
            if(fileNameLength.length>50)
            {
                alert('${((g.message(code: 'alert.filename.size.exceeds')))}')
                return false;
            }else {
                return true;
            }

            } else {
                alert("${message(code: 'alert.while.uploading')}")
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
    </script>

</section>

</body>
</html>
