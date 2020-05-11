/*
This method validates the input field for Email address with Regex Expression
 */
function validateEmailByRegex() {

    var email = document.getElementById('email');
    var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!reg.test(email.value)) {
        alert('Invalid email address!');
        return false;
    }
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

/*
Hide and Show a pop up box on Button Click
 */
$('#show').on('click', function () {
    $('.center').show();
    $(this).hide();
})

$('#close').on('click', function () {
    $('.center').hide();
    $('#show').show();
})
/*
 this is to mark an input field as disabled
 */
document.getElementById("disabled").disabled = true;

/*
this is just a simple reload; you can safely remove it; remember to remove it from the image too
 */
function reloadCaptcha() {
    document.getElementById('captcha').src = document.getElementById('captcha').src + '?' + new Date();
}