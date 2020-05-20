<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'pptxjs.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'nv.d3.min.css')}" type="text/css">

    <meta name="viewport" content="main">
    <title>${message(code: 'perform.file.preview')}</title>
    <asset:javascript src='jquery-3.3.1.min.js'/>
    <asset:javascript src='jquery-1.11.3.min.js'/>
    <asset:javascript  src='jszip.min.js'/>
    <asset:javascript src='filereader.js'/>
    <asset:javascript src='d3.min.js'/> <!-- for charts graphs -->
    <asset:javascript src='nv.d3.min.js'/> <!-- for charts graphs -->
    <asset:javascript src='pptxjs.js'/>
    <asset:javascript src='divs2slides.js'/>
    <div id="slide-resolte-contaniner" >

    </div>
    <script language="JavaScript" type="text/javascript">

        $("#slide-resolte-contaniner").pptxToHtml({

            pptxFileUrl:src="${resource(dir: 'upload/ppts', file: filename)}",
            slidesScale: "50%",
            slideMode: true,
            keyBoardShortCut: true,
            mediaProcess: true,
            slideModeconfig: {
                first: 1,
                nav: true,
                navTxtColor: true,
                showPlayPauseBtn: true,
                showSlideNum: true,
                showTotalSlideNum: true,
                autoSlide: 2,
                randomAutoSlide: false,
                loop: false,
                background: "black",
                transition: "slid",
                transitionTime: 1
            }
        });

    </script>

</head>

<body>
%{--<div id="content" role="main">
    <content tag="nav">
        <g:link controller="secured">
            <span class="bold-txt" title="${message(code: 'title.home.tooltip')}"><g:message
                    code="default.home.page"></g:message></span>

        </g:link>
    </content>

</div>--}%

<div id="design" role="main">

    <div id="dialog-confirm" title="preview">

        <div id="dialog">

        </div>
    </div>

</div>
</body>
</html>