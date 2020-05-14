<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 14-05-2020
  Time: 12:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="viewport" content="main">
    <title>'Preview'</title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='jquery-ui.min.js'/>
    <asset:stylesheet src='jquery-ui.min.css'/>
    <script>
        $(function () {
            var filePath = "${resource(dir: 'upload', file: filename)}"

            var fileName = filePath.replace(/^.*[\\\/]/, '')
            $("#dialog-confirm").dialog({
                resizable: true,
                title: fileName,
                height: 500,
                width: 600,
                modal: true,
                buttons: {
                    Cancel: function () {

                        window.location.href = "${createLink(controller: 'listing', action: 'doListing')}";
                    }
                },
                open: function () {
                    var object = "<object data=\"${resource(dir: 'upload', file: filename)}\" type:\"blob\", mimeType:\"application/vnd.openxmlformats-officedocument.wordprocessingml.document\" width=\"600px\" height=\"400px\">";
                    "</object>";
                    object = object.replace(/{FileName}/g, "upload/" + fileName);
                    $("#dialog").html(object);
                }
            });
        });
    </script>
</head>

<body>
<div id="design" role="main">

    <div id="dialog-confirm" title="preview">

        <div id="dialog">

        </div>
    </div>

</div>
%{--<area shape="rect" coords="0,0,82,126" alt="Sun" href="${resource(dir: 'upload/videos', file: filename)}" download>--}%
</body>
</html>