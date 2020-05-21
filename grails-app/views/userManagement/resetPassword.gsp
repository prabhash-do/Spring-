<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.reset.password.title')}</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.reset.password.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <g:form class="form-signin" action="resetPassword" params="[username: username]" method="POST"
                        id="resetpasswordForm"
                        autocomplete="off">

                    <div class="form-group">
                        <label for="newpassword">${message(code: 'springSecurity.new.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.new.password.label')}"
                               class="form-control" name="newpassword"
                               id="newpassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="confirmpassword">${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.confirm.password.label')}"
                               class="form-control"
                               name="confirmpassword"
                               id="confirmpassword" required/>
                    </div>

                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                            type="submit">${message(code: 'springSecurity.submit.button')}
                    </button>
                    <hr class="my-4">
                </g:form>
                <g:form controller="userManagement">
                    <button id="cancel" class="btn btn-lg btn-secondary btn-block text-uppercase"
                            type="submit">${message(code: 'default.button.cancel')}</button>
                </g:form>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function () {
        document.forms['resetpasswordForm'].elements['newpassword'].focus();
    });
</g:javascript>
</body>
</html>