const btnValidation = document.getElementById("btn-creation-restaurant");
const formInscription = document.getElementById("restaurantForm");

btnValidation.addEventListener("click", NewRestaurant);

function NewRestaurant() {

    let dataForm = new FormData(formInscription);

    let myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");

    const toArray = (s) =>
        (s || "")
            .split(",")
            .map(x => x.trim())
            .filter(Boolean);

    let raw = JSON.stringify({
        name: dataForm.get("name"),
        description: dataForm.get("description"),
        maxGuest: parseInt(dataForm.get("maxGuest"), 10),
        amOpeningTime: toArray(dataForm.get("amOpeningTime")),
        pmOpeningTime: toArray(dataForm.get("pmOpeningTime")),
    });

    let requestOptions = {
        method: 'POST',
        headers: myHeaders,
        body: raw, 
        redirect: 'follow'
    };

    fetch("/api/restaurant", requestOptions)
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            alert("Erreur lors de l'ajout du restaurant");
        }
        
    })
    .then((result) => {
        alert("Le restaurant a bien été ajouté");
        document.location.href="/";

    })
    .catch((error) => {
        console.error(error);
        alert("Erreur : " + error.message);
    });
}