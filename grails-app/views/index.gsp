<!doctype html>
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

<body onload="setup()">

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1><strong class="centered"><b>Hey! <sec:ifLoggedIn>
            <sec:username/>
        </sec:ifLoggedIn>${message(code: 'welcome.utils.tool')}</b></strong></h1>
    </section>
</div>
<g:render template="/templates/grailstemplates"/>

<div>
    <fieldset class="buttons">
        <ul>
            <li>
                <div id="progressStatus">
                    <div id="progressBar"></div>
                </div>
                <g:form controller="upload" action="doUpload" method="POST" enctype="multipart/form-data"
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

                        <asset:image src="upload.png"/>
                        <input type="submit" value="${message(code: 'default.upload.label', default: 'Upload')}"
                               onclick="return savefname()"/>
                        <input type="hidden" id="refreshed" value="no">
                    </span>
                </g:form>
            </li>
        </ul>
        <ul>
            <li><asset:image src="list.png"/>
            <g:link controller='listing' action='doListing'><g:message code="default.list.label"/></g:link>
            </li>
        </ul>
        <ul>
            <li>
                <asset:image src="delete.png"/>
                <g:link controller="deleteAll" action="doAllDelete"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message
                        code="default.all.delete.label"/>
                </g:link>
            </li>
        </ul>
    </fieldset>

    <div class="footer row" role="contentinfo">
        %{--        <p><g:message code="default.admin.user.role"></g:message></p>--}%
        <p><g:message code="default.client.user.role"></g:message></p>
    </div>

    <g:javascript>
        function savefname() {
            var filename = $('#file').val();
            if (filename != null && filename != '') {
                updateProgressBar();
                return true;
            } else {
                alert("${message(code: 'alert.while.uploading')}")
                return false;
            }
        }

        function updateProgressBar() {
            var progressBar = document.getElementById("progressBar");
            var progressStatus = document.getElementById("progressStatus");
            progressStatus.style.width = "auto";
            var width = 1;
            var identity = setInterval(scene, 10);

            function scene() {
                if (width >= 100) {
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
</body>
</html>
