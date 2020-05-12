document.addEventListener("DOMContentLoaded", function(event) {
    document.forms['loginForm'].elements['firstname'].focus();
});

function validateEmailByRegex() {

    var email = document.getElementById('email');
    var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!reg.test(email.value)) {
        alert('Invalid email address!');
        return false;
    }
}

function viewPassword()
{
    var passwordInput = document.getElementById('password');
    var passStatus = document.getElementById('pass-status');

    if (passwordInput.type == 'password'){
        passwordInput.type='text';
        passStatus.className='fa fa-eye-slash';

    }
    else{
        passwordInput.type='password';
        passStatus.className='fa fa-eye';
    }
}

function reloadCaptcha()
{
    document.getElementById('captcha').src = document.getElementById('captcha').src+ '?' +new Date();
}
