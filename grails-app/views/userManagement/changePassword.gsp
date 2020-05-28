<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>${message(code: 'springSecurity.change.password.title')}</title>
</head>

<body>
<div class="row" style=" margin-left:380px;margin-top: 80px;">

        <div class="card card-signin my-5">
            <div class="card-body">
                <h5 class="card-title text-center">${message(code: 'springSecurity.change.password.header')}</h5>
                <g:render template="/templates/grailstemplates"/>
                <form class="form-signin" action="changePassword" method="POST" id="changepasswordForm"
                      autocomplete="off">

                    <div class="form-group">
                        <label for="currentpassword">${message(code: 'springSecurity.current.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.current.password.label')}" value="${currentpassword}"
                               class="form-control"
                               name="currentpassword"
                               id="currentpassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="newpassword">${message(code: 'springSecurity.new.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.new.password.label')}" class="form-control" name="newpassword"
                               id="newpassword" required/>
                    </div>

                    <div class="form-group">
                        <label for="confirmpassword">${message(code: 'springSecurity.confirm.password.label')}</label>
                        <input type="password" placeholder="${message(code: 'springSecurity.confirm.password.label')}" class="form-control"
                               name="confirmpassword"
                               id="confirmpassword" required/>
                    </div>
                    <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase"
                            type="submit">${message(code: 'springSecurity.submit.button')}</button>
                    <hr class="my-4">
                </form>
                <g:form controller="myProfile" action="showProfileDetails">
                    <button id="cancel" class="btn btn-lg btn-secondary btn-block text-uppercase"
                            type="submit">${message(code: 'default.button.cancel')}</button>
                </g:form>
            </div>
    </div>
</div>
<g:javascript>
    document.addEventListener("DOMContentLoaded", function () {
        document.forms['changepasswordForm'].elements['currentpassword'].focus();
    });
</g:javascript>
</body>
</html>