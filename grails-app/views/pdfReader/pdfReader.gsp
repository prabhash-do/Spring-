<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="viewport" content="main">
    <title>${message(code: 'perform.file.listing')}</title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='jquery-ui.min.js'/>
    <asset:stylesheet src='jquery-ui.min.css'/>
    <script>
        $(function () {
            var fileName = "rty.pdf";
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
                    var object = "<object data=\"${resource(dir: 'upload', file: 'rty.pdf')}\" application/pdf\" width=\"600px\" height=\"400px\">";
                    "</object>";
                    object = object.replace(/{FileName}/g, "upload/" + fileName);

                    $("#dialog").html(object);
                }
            });
        });
    </script>
</head>

<body>
<div id="content" role="main">
    <content tag="nav">
        <g:link controller="secured">
            <span class="bold-txt" title="${message(code: 'title.home.tooltip')}"><g:message
                    code="default.home.page"></g:message></span>

        </g:link>
    </content>

</div>

<div id="design" role="main">

    <div id="dialog-confirm" title="preview">

        <div id="dialog">

        </div>
    </div>

</div>
</body>
</html>