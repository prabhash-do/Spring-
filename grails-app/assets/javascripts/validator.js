/**
 * validate email address format
 * @returns {boolean}
 */
var validateEmailByRegex = function () {
    var isMailOk = false;
    var email = document.getElementById('email');
    var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!reg.test(email.value)) {
        document.getElementById("isE").style.color = "red";
        document.getElementById("isE").innerHTML = "Invalid email address!";
        document.forms['registerForm'].elements['email'].focus();
        isMailOk = false;
    } else {
        document.getElementById("isE").style.color = "green";
        document.getElementById("isE").innerHTML = "Valid";
        isMailOk = true;
    }
    return isMailOk;
}

/**
 * Minimum 8 and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character
 * @returns {boolean}
 */
function validatePasswordByRegex() {
    var isPassOk = false;
    var pass = document.getElementById('password');
    var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

    if (!reg.test(pass.value)) {
        document.getElementById("isP").style.color = "red";
        document.getElementById("isP").innerHTML = "Invalid password format!";
        document.forms['registerForm'].elements['password'].focus();
        isPassOk = false;
    } else {
        document.getElementById("isP").style.color = "green";
        document.getElementById("isP").innerHTML = "Validated";
        isPassOk = true;
    }
    return isPassOk;
}

/**
 * Minimum 8 and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character
 * @returns {boolean}
 */
function validatePasswordByRegex() {
    var isPassOk = false;
    var pass = document.getElementById('password');
    var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

    if (!reg.test(pass.value)) {
        document.getElementById("isP").style.color = "red";
        document.getElementById("isP").innerHTML = "Invalid password format!";
        document.forms['registerForm'].elements['password'].focus();
        isPassOk = false;
    } else {
        document.getElementById("isP").style.color = "green";
        document.getElementById("isP").innerHTML = "Validated";
        isPassOk = true;
    }
    return isPassOk;
}

function reloadCaptcha() {
    document.getElementById('captcha').src = document.getElementById('captcha').src + '?' + new Date();
}

/*
This method validates the password toggle eye-icon
 */
function viewPassword() {
    var passwordInput = document.getElementById('password');
    var passStatus = document.getElementById('pass-status');

    if (passwordInput.type == 'password') {
        passwordInput.type = 'text';
        passStatus.className = 'fa fa-eye-slash';

    } else {
        passwordInput.type = 'password';
        passStatus.className = 'fa fa-eye';
    }
}