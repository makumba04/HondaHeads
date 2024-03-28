function mostrarModelos() {

    fetch(`http://localhost:3000/modelos`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
}

function mostrarMotores() {

    fetch(`http://localhost:3000/motores`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
}

function mostrarMotorizaciones() {

    fetch(`http://localhost:3000/motorizaciones`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
}