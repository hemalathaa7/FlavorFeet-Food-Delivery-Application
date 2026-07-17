// ==========================================
// Password Show / Hide
// ==========================================

const password = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");

if (password && togglePassword) {

    togglePassword.addEventListener("click", function () {

        if (password.type === "password") {

            password.type = "text";

            this.classList.remove("fa-eye");
            this.classList.add("fa-eye-slash");

        } else {

            password.type = "password";

            this.classList.remove("fa-eye-slash");
            this.classList.add("fa-eye");

        }

    });

}



// ==========================================
// Role Card Selection
// ==========================================

const roleCards = document.querySelectorAll(".role-card");
const selectedRole = document.getElementById("selectedRole");

roleCards.forEach(card => {

    card.addEventListener("click", function () {

        roleCards.forEach(item => {

            item.classList.remove("active");

        });

        this.classList.add("active");

        selectedRole.value = this.dataset.role;

    });

});



// ==========================================
// Input Focus Animation
// ==========================================

const inputs = document.querySelectorAll(".input-box input");

inputs.forEach(input => {

    input.addEventListener("focus", function () {

        this.parentElement.style.transform = "translateY(-2px)";

    });

    input.addEventListener("blur", function () {

        this.parentElement.style.transform = "translateY(0px)";

    });

});



// ==========================================
// Button Ripple Effect
// ==========================================

const registerButton = document.querySelector(".register-btn");

if (registerButton) {

    registerButton.addEventListener("click", function (e) {

        const ripple = document.createElement("span");

        const diameter = Math.max(this.clientWidth, this.clientHeight);

        ripple.style.width = diameter + "px";
        ripple.style.height = diameter + "px";

        ripple.style.left = (e.offsetX - diameter / 2) + "px";
        ripple.style.top = (e.offsetY - diameter / 2) + "px";

        ripple.classList.add("ripple");

        const oldRipple = this.querySelector(".ripple");

        if (oldRipple) {

            oldRipple.remove();

        }

        this.appendChild(ripple);

    });

}



// ==========================================
// Page Animation
// ==========================================

window.addEventListener("load", function () {

    const card = document.querySelector(".register-card");

    if (card) {

        card.style.opacity = "0";

        card.style.transform = "translateY(40px)";

        setTimeout(function () {

            card.style.transition = "all .8s ease";

            card.style.opacity = "1";

            card.style.transform = "translateY(0px)";

        }, 150);

    }

});



// ==========================================
// Button Hover Glow
// ==========================================

if (registerButton) {

    registerButton.addEventListener("mouseenter", function () {

        this.style.boxShadow =
        "0 20px 45px rgba(255,107,53,.45)";

    });

    registerButton.addEventListener("mouseleave", function () {

        this.style.boxShadow =
        "0 12px 30px rgba(255,107,53,.35)";

    });

}



// ==========================================
// Form Validation
// ==========================================

const form = document.querySelector("form");

if (form) {

    form.addEventListener("submit", function (e) {

        if (selectedRole.value === "") {

            alert("Please select a user type.");

            e.preventDefault();

        }

    });

}