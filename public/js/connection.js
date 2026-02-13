console.log("✅ connection.js chargé - v2");

const mailInput = document.getElementById("EmailInput");
const passwordInput = document.getElementById("PasswordInput");
const btnSignin = document.getElementById("btnSignin");
const signinForm = document.getElementById("signinForm");

btnSignin.addEventListener("click", checkCredentials);

function checkCredentials() {
    const dataForm = new FormData(signinForm);

    const myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    const raw = JSON.stringify({
        "username": dataForm.get("email"),
        "password": dataForm.get("mdp")
    });

    const requestOptions = {
        method: "POST",
        headers: myHeaders,
        body: raw,
        redirect: "follow"
    };

    fetch("/api/login", requestOptions)
        .then(async(response) => {
        if (!response.ok) {
            mailInput.classList.add("is-invalid");
            passwordInput.classList.add("is-invalid");
            throw new Error("Identifiants invalides");
        } 
        
        return response.json();
    
        })
        .then((result) => {
            // Cookie valable pour tout le site
            document.cookie = `apiToken=${result.apiToken}; Path=/; SameSite=Lax`;
            // Optionnel : garder aussi en localStorage si tu veux
            localStorage.setItem("apiToken", result.apiToken);
            window.location.replace("/");
        })
        .catch((error) => {
        console.error(error);
    });

}

