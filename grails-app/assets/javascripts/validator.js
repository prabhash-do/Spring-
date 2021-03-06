/**
 * validate email address format
 * @returns {boolean}
 */
var validateEmailByRegex = function () {
    var isMailOk = false;
    var email = document.getElementById('email');
    var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!reg.test(email.value)) {
        $("#email").css("border", "1px solid red");
        document.getElementById("isE").style.color = "red";
        document.getElementById("isE").innerHTML = "Invalid email address!";
        isMailOk = false;
    } else {
        $("#email").css("border", "1px solid green");
        document.getElementById("isE").style.color = "green";
        document.getElementById("isE").innerHTML = "Valid";
        isMailOk = true;
    }
    return isMailOk;
}

/**
 * Minimum 8 and maximum 20 characters, at least one uppercase letter, one lowercase letter, one number and one special character
 * @returns {boolean}
 */
function validatePasswordByRegex() {
    var isPassOk = false;
    var pass = document.getElementById('password');
    var reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?#&])[A-Za-z\d@$!%*?#&]{8,20}$/;

    if (!reg.test(pass.value)) {
        $("#password").css("border", "1px solid red");
        document.getElementById("isP").style.color = "red";
        document.getElementById("isP").innerHTML = "Password does not match with the password complexity";
        isPassOk = false;
    } else {
        $("#password").css("border", "1px solid green");
        document.getElementById("isP").style.color = "green";
        document.getElementById("isP").innerHTML = "Validated";
        isPassOk = true;
    }
    return isPassOk;
}

/**
 * Checks password and confirm password are matched or not
 * @returns {boolean}
 */
function checkPassword() {
    var check = false;
    if (document.getElementById('password').value === document.getElementById('confirmPassword').value) {
        document.getElementById('isP').style.color = 'green';
        document.getElementById('isP').innerHTML = 'Passwords Matched';
        if (validatePasswordByRegex()) {
            check = true;
        }
    } else {
        $("#password").css("border", "1px solid red");
        document.getElementById('isP').style.color = 'red';
        document.getElementById('isP').innerHTML = 'Passwords not match';
        check = false;
    }
    return check;
}

/**
 * This function calls checkPassword() function to validate password if manually typed
 * for AUTO-GENERATED password no validation works
 * @returns {boolean}
 */
function isAutoPasswordChecked() {
    var check = false;
    var checkbox = document.querySelector('input[type="checkbox"]');
    if ($(checkbox).is(":checked")) {
        check = true;
    } else {
        if (checkPassword()) {
            check = true;
        }
    }
    return check;
}

/**
 * this function reloads the captcha on reset button click
 */
function reloadCaptcha() {
    document.getElementById('captcha').src = document.getElementById('captcha').src + '?' + new Date();
}

/*
This function validates the password toggle eye-icon
 */
function viewOldPassword() {
    var passwordInput = document.getElementById('currentpassword');
    var passStatus = document.getElementById('opass-status');

    if (passwordInput.type == 'password') {
        passwordInput.type = 'text';
        passStatus.className = 'fa fa-eye-slash';

    } else {
        passwordInput.type = 'password';
        passStatus.className = 'fa fa-eye';
    }
}

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

function viewConfirmPassword() {
    var passwordInput = document.getElementById('confirmPassword');
    var passStatus = document.getElementById('cpass-status');

    if (passwordInput.type == 'password') {
        passwordInput.type = 'text';
        passStatus.className = 'fa fa-eye-slash';

    } else {
        passwordInput.type = 'password';
        passStatus.className = 'fa fa-eye';
    }
}

/* This function validates mobile number to accept only integer values
*/
function isNumberKey1(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}