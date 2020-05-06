document.addEventListener("DOMContentLoaded", function(event) {
    document.forms['loginForm'].elements['firstname'].focus();
});

function passwordDisplayToggle() {
    var toggleEl = document.getElementById("passwordToggler");
    var eyeIcon = '\u{1F441}';
    var xIcon = '\u{2715}';
    var passEl = document.getElementById("password");
    if (passEl.type === "password") {
        toggleEl.innerHTML = xIcon;
        passEl.type = "text";
    } else {
        toggleEl.innerHTML = eyeIcon;
        passEl.type = "password";
    }
}

function validateEmailByRegex() {

    var email = document.getElementById('email');
    var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!reg.test(email.value)) {
        alert('Invalid email address!')
        return false;
    }
}
