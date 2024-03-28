function buscarMotores() { // Función buscarMotores: Busca los motores en la base de datos

    var CodigoMotor = document.getElementById('CodigoMotor').value; // Guarda el valor del input donde se pone el codigo de motor

    if(CodigoMotor == ''){
    
        fetch(`http://localhost:3000/TodosMotores`)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            mostrarTodosMotores(data);
        })
        .catch(error => console.error('Error:', error));
    } else {
        // Aquí iría la función correspondiente para obtener los datos por la referencia del código de motor

        fetch(`http://localhost:3000/MotorPorCodigo/${CodigoMotor}`)
        .then(response => response.json())
        .then(data => {
            console.log(data);
            mostrarMotorPorCodigo(data, CodigoMotor);
        })
        .catch(error => console.error('Error:', error));
    }
}

function mostrarMotorizaciones() {

    fetch(`http://localhost:3000/motorizaciones`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
}

function mostrarTodosMotores(motores){

    var tablaMotor = document.getElementById('tabla_motor');

    if(motores.length > 0){

        var tablaMotor = document.getElementById('tabla_motor');
        var tabla = "<table id='motores'><thead><tr><th>Combustible</th><th>Código de Motor</th><th>Tipo de motor</th><th>Relación de compresión</th><th>Diametro y carrera</th><th>Potencia máxima</th><th>Par máximo</th></tr></thead><tbody>";

        motores.forEach(motor => {

            if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
                var combustibleClass = motor.Combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
            } else { // Si el combustible es cualquiera de los otros dos tipos
                var combustibleClass = motor.Combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
            }

            tabla += `<tr><td class='${combustibleClass}'>${motor.Combustible}</td><td class='${combustibleClass}'>${motor.CodigoMotor}</td><td class='${combustibleClass}'>${motor.TipoMotor}</td><td class='${combustibleClass}'>${motor.RelacionCompresion}</td><td class='${combustibleClass}'>${motor.DiametroCarrera}</td><td class='${combustibleClass}'>${motor.PotenciaMaxima}</td><td class='${combustibleClass}'>${motor.ParMaximo}</td></tr>`;
        });

        tabla += "</tbody></table>";
        tablaMotor.innerHTML = tabla;
    } else {
        tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron motores en la base de datos</p>`; // ...muestra un mensaje de advertencia
    }
}

function mostrarMotorPorCodigo(motor, CodigoMotor){

    var tablaMotor = document.getElementById('tabla_motor'); // Se crea un handler para el contenedor de que recoge a la tabla

    if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
        var combustibleClass = motor.Combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
    } else { // Si el combustible es cualquiera de los otros dos tipos
        var combustibleClass = motor.Combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
    }

    if(motor){ // Verifica si se ha encontrado un motor

        // Se crea un handler para generar la tabla con los datos del motor específico, tambien se añade la clase de cada td según el combustible que use

        var tabla = "<table id='motores'><thead><tr><th>Combustible</th><th>Código de Motor</th><th>Tipo de motor</th><th>Relación de compresión</th><th>Diametro y carrera</th><th>Potencia máxima</th><th>Par máximo</th></tr></thead><tbody>";

        tabla += `<tr><td class='${combustibleClass}'>${motor.Combustible}</td><td class='${combustibleClass}'>${motor.CodigoMotor}</td><td class='${combustibleClass}'>${motor.TipoMotor}</td><td class='${combustibleClass}'>${motor.RelacionCompresion}</td><td class='${combustibleClass}'>${motor.DiametroCarrera}</td><td class='${combustibleClass}'>${motor.PotenciaMaxima}</td><td class='${combustibleClass}'>${motor.ParMaximo}</td></tr>`;
        tabla += "</tbody></table>";

        tablaMotor.innerHTML = tabla; // Se agrega al HTML interno la tabla generada
    } else { // En caso de no encontrar el motor...
        tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron datos para el código de motor '${CodigoMotor}'</p>`; // ...muestra un mensaje de advertencia
    }
}
