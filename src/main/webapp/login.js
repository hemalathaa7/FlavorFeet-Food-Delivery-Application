const password = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");

togglePassword.onclick = function () {

    if (password.type === "password") {
        password.type = "text";
    } else {
        password.type = "password";
    }

}