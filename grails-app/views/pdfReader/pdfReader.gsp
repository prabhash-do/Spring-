<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="viewport" content="main">
    <title>${message(code: 'perform.file.preview')}</title>
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
                        $(this).dialog("close");
                    }
                },
                open: function () {
                    var object = "<object data=\"${resource(dir: 'upload', file: filename)}\" type=\"application/pdf\" width=\"600px\" height=\"400px\">";
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
</body>
</html>