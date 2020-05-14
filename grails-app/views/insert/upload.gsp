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

    /*#progressStatus1 {
        width: 0%;
        background-color: #ddd;
    }

    #progressBar1 {
        width: 0%;
        height: 35px;
        background-color: #4CAF50;
        text-align: center;
        line-height: 32px;
        color: white;
    }

    #progressStatus2 {
        width: 0%;
        background-color: #ddd;
    }

    #progressBar2 {
        width: 0%;
        height: 35px;
        background-color: #0faf49;
        text-align: center;
        line-height: 32px;
        color: white;
    }*/
    </style>

</head>

<body onload="setup()">
<section id="services">
    <div class="container">
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
            %{--<div class="row space-rows" id="animated-cards">
                <div class="col">
                    <div class="card cards-shadown cards-hover">
                        <div class="card-header"><span class="space"><i class="fab fa-angular service-icon" id="service-icon-1"></i></span>
                            <div class="cardheader-text">
                                <p id="cardheader-subtext-1" class="cardheader-subtext">Choose Files/images</p>

                                    <input type="file" name="file" id="file0" accept="image/*,application/*">
                                    <div id="progressStatus0">
                        <div id="progressBar0"></div>
                    </div>

                            </div>
                        </div>

                        <input type="submit" id="submit0" value="${message(code: 'default.upload.label', default: 'Upload')}" disabled="disabled"
                           onclick="return savefname0()"/></span>
                </div>
            </div>
            <div class="col">
                <div class="card cards-shadown cards-hover">
                    <div class="card-header"><span class="space"><i class="fab fa-windows service-icon"
                                                                    id="service-icon-2"></i></span>

                        <div class="cardheader-text">

                            <p id="cardheader-subtext-2" class="cardheader-subtext">Choose Video/Audio</p>

                            <div>
                                <input type="file" name="file" id="file1" accept="audio/*,video/*"/>
                            </div>

                            <div id="progressStatus1">
                                <div id="progressBar1"></div>
                            </div>

                        </div>
                    </div>
                    <input type="submit" id="submit1"
                           value="${message(code: 'default.upload.label', default: 'Upload')}" disabled="disabled"
                           onclick="return savefname1()"/>
                </div>
            </div>

            <div class="col">
                <div class="card cards-shadown cards-hover">
                    <div class="card-header cards-header-hover"><span class="space"><i class="fab fa-java service-icon"
                                                                                       id="service-icon-3"></i></span>

                        <div class="cardheader-text">

                            <p id="cardheader-subtext-3" class="cardheader-subtext">Choose PPT/Jar</p>
                            <input type="file" name="file" id="file2" accept=".pptx,.jar"/>

                            <div id="progressStatus2">
                                <div id="progressBar2"></div>
                            </div>
                        </div>

                    </div>
                    <input type="submit" id="submit2"
                           value="${message(code: 'default.upload.label', default: 'Upload')}" disabled="disabled"
                           onclick="return savefname2()"/>
                    <input type="hidden" id="refreshed" value="no">
                </div>
            </div>--}%

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
         %{--function savefname1() {
            var filename = $('#file1').val();
            if (filename != null && filename != '') {
                updateProgressBar1();
                 var fileNameLength = document.getElementById("file1").files[0].name;
            if(fileNameLength.length>50)
            {
                alert('${((g.message(code: 'alert.filename.size.exceeds')))}')
                return false;
            }else {
                return true;
            }
                return true;
            } else {
                alert("${message(code: 'alert.while.uploading')}")
                return false;
            }
        }
        function savefname2() {
            var filename = $('#file2').val();
            if (filename != null && filename != '') {
                updateProgressBar2();
                 var fileNameLength = document.getElementById("file2").files[0].name;
            if(fileNameLength.length>50)
            {
                alert('${((g.message(code: 'alert.filename.size.exceeds')))}')
                return false;
            }else {
                return true;
            }
                return true;
            } else {
                alert("${message(code: 'alert.while.uploading')}")
                return false;
            }
        }--}%

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
            /*function updateProgressBar1() {
            var progressBar = document.getElementById("progressBar1");
            var progressStatus = document.getElementById("progressStatus1");
            progressStatus.style.width = "auto";
            var width = 1;
            var identity = setInterval(scene, 10);

            function scene() {
                if (width >= 100) {
                    $('#submit1').prop('disabled', false);
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
         function updateProgressBar2() {
            var progressBar = document.getElementById("progressBar2");
            var progressStatus = document.getElementById("progressStatus2");
            progressStatus.style.width = "auto";
            var width = 1;
            var identity = setInterval(scene, 10);

            function scene() {
                if (width >= 100) {
                    clearInterval(identity);
                    $('#submit2').prop('disabled', false);
                    progressBar.hidden = true;
                    progressStatus.hidden = true;
                } else {
                    width++;
                    progressBar.style.width = width + '%';
                    progressBar.innerHTML = width  + '%';
                }
            }
        }*/
        </g:javascript>
    </div>
    <script type="text/javascript">
        $('#file0').change(function () {
            $('#submit0').removeAttr('disabled')
        })
    </script>
    %{--<script type="text/javascript">
        $('#file1').change(function () {
            $('#submit1').removeAttr('disabled')
        })
    </script>
    <script type="text/javascript">
        $('#file2').change(function () {
            $('#submit2').removeAttr('disabled')
        })</script>--}%
    %{--<script type="text/javascript">
        $("#submit0").one('click', function (event) {
            event.preventDefault();
            //do something
            $(this).prop('disabled', true);
        });</script>

    <script type="text/javascript">
        $("#submit1").one('click', function (event) {
            event.preventDefault();
            //do something
            $(this).prop('disabled', true);
        });</script>

    <script type="text/javascript">
        $("#submit2").one('click', function (event) {
            event.preventDefault();
            //do something
            $(this).prop('disabled', true);
        });</script>
--}%

</section>

</body>
</html>
