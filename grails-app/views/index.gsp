<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
    .delete_test {
        text-align: center;
    }

    .file-preview {
        background: #fdf8ff;
        box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        -moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        -webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
        display: inline-block;
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

    .w3-quarter {
        width: 20%;
        float: left;
    }

    .shadown {
        box-shadow: 2px 2px 30px #aaaaaa;
    }

    .zoom {
        background-color: transparent;
        transition: transform .2s;

    }

    .zoom:hover {
        /*-ms-transform: scale(1.3); !* IE 9 *!*/
        /*-webkit-transform: scale(1.3); !* Safari 3-8 *!*/
        transform: scale(1.1);
    }
    </style>
    <content tag="menu.item"><g:message code="side.bar.index.overview.title"/></content>
    <meta name="layout" content="main"/>
    <title><g:message code="main.index.my.dashboard.title"/></title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='sweetalert.min.js'/>

</head>
<title><g:message code="main.title"/></title>
<meta charset="UTF-8">
<style>
html, body, h1, h2, h3, h4, h5 {
    font-family: "Raleway", sans-serif
}
</style>

<body class="w3-light-grey">
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top: 100px;">
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i><g:message code="main.index.my.dashboard.title"/></b></h5>
    <hr class="my-4"/>
    </header>

<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
        <g:form id="all" name="all" controller="listing" action="doListing">
            <div class="shadown zoom" onclick="submitAll()">
                <div class="w3-container w3-cyan w3-padding-16">
                    <div class="w3-left"><i class="fa fa-list w3-xxxlarge"></i></div>

                    <div class="w3-right">
                        <h5>${numberOfAllFiles}</h5>
                    </div>

                    <div class="w3-clear" align="left"></div>
                    <h5><g:message code="main.index.box.all.files.title"/></h5>
                </div>
            </div>
        </g:form>
    </div>

    <div class="w3-quarter">
        <g:form id="documents" name="documents" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="documents"/>
            <div class="shadown zoom" onclick="submitDoc()">
                <div class="w3-container w3-red w3-padding-16">
                    <div class="w3-left"><i class="fa fa-file-pdf-o w3-xxxlarge"></i></div>

                    <div class="w3-right" id="documents">
                        <h5>${numberOfDocFiles}</h5>
                    </div>

                    <div class="w3-clear" align="left"></div>
                    <h5><g:message code="main.index.box.document.title"/></h5>
                </div>
            </div>
        </g:form>
    </div>
    <div class="w3-quarter">
        <g:form id="formimages" name="formimages" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="images"/>
            <div class="shadown zoom" onclick="submitImages()">
                <div class="w3-container w3-indigo w3-padding-16">
                    <div class="w3-left"><i class="fa fa-file-image-o w3-xxxlarge"></i></div>

                    <div class="w3-right" id="images">
                        <h5>${numberOfImageFiles}</h5>
                    </div>

                    <div class="w3-clear" align="left"></div>
                    <h5><g:message code="main.index.box.images.title"/></h5>
                </div>
            </div>
        </g:form>
    </div>
    <div class="w3-quarter">
        <g:form id="ppts" name="ppts" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="ppts"/>
            <div class="shadown zoom" onclick="submitPpts()">
                <div class="w3-container w3-teal w3-padding-16">
                    <div class="w3-left"><i class="fa fa-file-powerpoint-o w3-xxxlarge"></i></div>

                    <div class="w3-right" id="ppts">
                        <h5>${numberOfPptFiles}</h5>
                    </div>

                    <div class="w3-clear" align="left"></div>
                    <h5><g:message code="main.index.box.ppt.title"/></h5>
                </div>
            </div>
        </g:form>
    </div>

    <div class="w3-quarter">
        <g:form id="videos" name="videos" controller="listing" action="doListingByFileType">
            <g:hiddenField name="fileType" id="fileType" value="videos"/>
            <div class="shadown zoom" onclick="submitVideos()">
                <div class="w3-container w3-orange w3-text-white w3-padding-16">
                    <div class="w3-left"><i class="fa fa-file-video-o w3-xxxlarge"></i></div>

                    <div class="w3-right" id="videos">
                        <h5>${numberOfVideoFiles}</h5>
                    </div>

                    <div class="w3-clear" align="left"></div>
                    <h5><g:message code="main.index.box.video.title"/></h5>
                </div>
            </div>
        </g:form>
    </div>
</div>
<g:if test="${dblist}">
    <div class="w3-panel">
    <div class="w3-panel" style="margin-left:-16px;">
    <g:form controller="listing" action="searchList" method="post">
        <g:textField id="searchtext" class="input-xxlarge" name="srch"
                     placeholder="${message(code: 'default.search.placeholder')}" value="${srch}"/>
        <button id="submit-values" class="buttons" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
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
                            <a href="${resource(dir: 'upload/documents', file: it.fileName)}" download/>
                            <img style="height:50px ;width:50px"
                                 src="${resource(dir: 'images', file: 'docx.png')}" alt="Image"/>
                        </div>
                    </g:if>
                    <g:if test="${it.fileName.toLowerCase().contains(".xlsx") || it.fileName.toLowerCase().contains(".xls") || it.fileName.toLowerCase().contains(".csv")}">
                        <div class="file-preview">
                            <a href="${resource(dir: 'upload/documents', file: it.fileName)}" download/>
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
                    <a id="del_file" href="#"
                       onclick="deleteFile('${it.fileName}')"><i
                            class="fa fa-trash fa-2x" aria-hidden="true" title="<g:message
                                    code="default.delete.label"/>"></i></a>
                </div></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="w3-panel" style="margin-left: 180px">
        <div class="w3-panel">
            <img style="height:300px ;width:600px"
                 src="${resource(dir: 'images', file: 'emptyFolderState.png')}" alt="Image"/>
        </div>
    </div>
</g:else>

    <!-- Footer -->
%{--    <footer class="w3-container w3-padding-16 w3-light-grey">--}%
%{--        <div class="footer row" role="contentinfo">--}%
%{--            <p><g:message code="default.index.footer.message"></g:message></p>--}%
%{--        </div>--}%
%{--    </footer>--}%
    <!-- End page content -->

    <script type="text/javascript" >

        function deleteFile(data) {
            swal({
                // options...
                title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this file!",
                icon: "warning",
                buttons:true,
                dangerMode: true,
                closeonConfirm: false
            }).then(function(isConfirm) {
                if ( isConfirm) {
                    $.ajax({
                        type: 'POST',
                        data: "filename=" +data,
                        url: '${createLink(controller: 'delete' ,action: 'doDelete')}',
                        success: function (data) {

                            swal({
                                title: "Deleted!",
                                text: "Your file has been deleted",
                                icon: "success",
                                buttons: true,
                                close: false
                            }).then(function (isConfirm) {
                                if (isConfirm) {
                                    location.reload()
                                }
                            })
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
                            swal('Deleted!', 'All file has been deleted.', 'success');
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


    <script>

        function submitAll() {
            document.forms['all'].submit()
        }

        function submitDoc() {
            document.forms['documents'].submit()

        }

        function submitImages() {
            document.forms['formimages'].submit()

        }

        function submitVideos() {
            document.forms['videos'].submit()

        }

        function submitPpts() {
            document.forms['ppts'].submit()

        }
    </script>
    </div>
</div>
</body>
</html>