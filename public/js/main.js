function generationData(generation_id) {
    searchGenerationData(generation_id);
    searchGenerationEngines(generation_id);
}
function searchGenerationData(generation_id){
    fetch(`http://localhost:3000/generationData/${generation_id}`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        showGenerationData(data);
    })
    .catch(error => console.error('Error:', error));
}
function searchGenerationEngines(generation_id) {
    fetch(`http://localhost:3000/motorizations/${generation_id}`)
    .then(response => response.json()) 
    .then(data => {
        showGenerationEngines(data);
    })
    .catch(error => console.error('Error:', error));
}
function buscarMotores() { // Función buscarMotores: Busca los motores en la base de datos

    var CodigoMotor = document.getElementById('CodigoMotor').value.toUpperCase(); // Guarda el valor del input donde se pone el codigo de motor
    // var filtro = document.getElementById('filtro').value; EL FILTRO AUN NO FUNCIONA

    // Primero pasa por este bloque if - else que compara las siguientes condicionales

    if (CodigoMotor == '') {// Si la variable anteriormente guardada tiene un valor vacio (es decir, no se ha escrito nada en el input) y no existe filtro

        fetch(`http://localhost:3000/TodosMotores`) // El programa llama por URL al método de buscar todos los motores en la API
        .then(response => response.json()) // Guarda la respuesta en formato JSON
        .then(data => { // Luego hace las siguientes acciones con los datos...
            mostrarTodosMotores(data); // Luego llama al método mostrarMotorPorCodigo enviandole los datos recibidos para que haga su función
        })
        .catch(error => console.error('Error:', error)); // Si ocurre algún tipo de error en el proceso lo envía a la consola
    } else { // En el caso de si tener un input, se realiza lo siguiente

        fetch(`http://localhost:3000/MotorPorCodigo/${CodigoMotor}`) // Se llama a la función de búsqueda del motor por su código correspondiente
        .then(response => response.json()) // Guarda la respuesta en formato JSON
        .then(data => { // Luego hace las siguientes acciones con los datos...
            mostrarMotorPorCodigo(data, CodigoMotor); // Luego llama al método mostrarTodosMotores enviandole los datos recibidos para que haga su función
        })
        .catch(error => console.error('Error:', error)); // Si ocurre algún tipo de error en el proceso lo envía a la consola
    }
}
function mostrarTodosMotores(motores){ // Función mostrarTodosMotores: Recibe los datos de la función de busqueda para mostrarlos en una tabla

    var tablaMotor = document.getElementById('tabla_motor'); // Primero crea un handler para el contenedor de la tabla

    if(motores){ // Primero verifica si se ha encontrado un motor

        if(motores.length > 0){ // Como los datos JSON (cuando son varios) llegan en forma de array, primero verifica que al menos haya más de uno
        
            const headers = [
                "Combustible",
                "Código de Motor",
                "Tipo de motor",
                "Cilindrada",
                "Relación de compresión",
                "Diametro y carrera",
                "Potencia máxima",
                "Par máximo"
            ];

            var tabla = document.createElement('table');
            tabla.setAttribute('id', 'motores');
            var thead = document.createElement('thead');
            var tr_thead = document.createElement('tr');
            var tbody = document.createElement('tbody');
            var tr_body = document.createElement('tr');
            
            headers.forEach(headerText => {
                const th = document.createElement('th');
                th.textContent = headerText;             
                tr_thead.appendChild(th);                      
            });
            
            thead.appendChild(tr_thead);

            motores.forEach(motor => { // Luego usando el método de String "forEach()" itera sobre cada uno de los subarrays dentro del array de motores que recibe en JSON

                // Luego pasa por este bloque if - else para comparar lo siguiente
                if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
                    var combustibleClass = motor.combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
                } else { // Si el combustible es cualquiera de los otros dos tipos
                    var combustibleClass = motor.combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
                }

                // Luego genera una tabla con todos los datos necesarios para crear dicha fila de datos sobre el motor en esa iteración
                tr_body.innerHTML = `<td class='${combustibleClass}'>${motor.combustible}</td><td class='${combustibleClass}'>${motor.codigoMotor}</td><td class='${combustibleClass}'>${motor.tipoMotor}</td><td class='${combustibleClass}'>${motor.cilindrada}</td><td class='${combustibleClass}'>${motor.relacionCompresion}</td><td class='${combustibleClass}'>${motor.diametroCarrera}</td><td class='${combustibleClass}'>${motor.potenciaMaxima}</td><td class='${combustibleClass}'>${motor.parMaximo}</td>`;
                tbody.appendChild(tr_body);
            });

            tabla.appendChild(tbody);
            tablaMotor.appendChild(tabla)
        } else { // En caso de no recibir ni un solo dato del JSON
            tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron motores en la base de datos</p>`; // ...muestra un mensaje de advertencia
        }
    }
}
function mostrarMotorPorCodigo(motores, CodigoMotor){ // Función mostrarMotorPorCodigo: Recibe dos líneas de datos, la primera es el JSON con los datos del motor y la segunda es el código de motor específico

    var tablaMotor = document.getElementById('tabla_motor'); // Se crea un handler para el contenedor de que recoge a la tabla

    if(motores){ // Primero verifica si se ha encontrado un motor

        if(motores.length > 0){ // Luego verifica si el array de motores es al menos mayor que 0 (Lo que significa que ha encontrado al menos una coincidencia)

            const headers = ["Combustible", "Código de Motor", "Tipo de motor", "Cilindrada", "Relación de compresión", "Diametro y carrera", "Potencia máxima", "Par máximo"];

            var tabla = document.createElement('table');
            tabla.setAttribute('id', 'motores');
            var thead = document.createElement('thead');
            var tr_thead = document.createElement('tr');
            var tbody = document.createElement('tbody');
            var tr_body = document.createElement('tr');
            
            headers.forEach(headerText => {
                const th = document.createElement('th');
                th.textContent = headerText;             
                tr_thead.appendChild(th);                      
            });
            
            thead.appendChild(tr_thead);

            motores.forEach(motor => {

                // Luego se pasa por este bloque if - else para comparar la siguiente condición
                if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
                    var combustibleClass = motor.combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
                } else { // Si el combustible es cualquiera de los otros dos tipos
                    var combustibleClass = motor.combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
                }

                // Luego se crea el código para generar la parte de la tabla que muestra la información del motor buscado
                tr_body.innerHTML = `<tr><td class='${combustibleClass}'>${motor.combustible}</td><td class='${combustibleClass}'>${motor.codigoMotor}</td><td class='${combustibleClass}'>${motor.tipoMotor}</td><td class='${combustibleClass}'>${motor.cilindrada}</td><td class='${combustibleClass}'>${motor.relacionCompresion}</td><td class='${combustibleClass}'>${motor.diametroCarrera}</td><td class='${combustibleClass}'>${motor.potenciaMaxima}</td><td class='${combustibleClass}'>${motor.parMaximo}</td></tr>`;
                tbody.appendChild(tr);
            })
            tabla.appendChild(tbody)
            tablaMotor.appendChild(tabla); // Se agrega al HTML interno la tabla generada
        } else { // En caso de recibir el array vacio (Lo que significa no encontrar ni una sola coincidencia)...
            tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron datos para el código de motor '${CodigoMotor}'</p>`; // ...muestra un mensaje de advertencia
        }
    }
}
function showGenerationData(generation) {

    var container = document.getElementById('datos_generacion');
    var data_list = document.createElement('ul');

    var longitudChasis = document.createElement('li')
    longitudChasis.textContent = `Longitud de chasis: ${generation.longitudChasis}`;
    data_list.appendChild(longitudChasis);

    var peso = document.createElement('li')
    peso.textContent = `Peso: ${generation.peso}`;
    data_list.appendChild(peso);
    
    var transmision = document.createElement('li')
    transmision.textContent = `Transmision: ${generation.transmision}`;
    data_list.appendChild(transmision);

    if(generation.datosExtra != null) { 
        var datosExtra = document.createElement('li')
        datosExtra.textContent = `Datos extra: ${generation.datosExtra}`;
        data_list.appendChild(datosExtra);
    }

    container.appendChild(data_list);
}
function showGenerationEngines(motorizations) {
    
    const headers = [
        "Codigo de motor", "Periodo de uso"
    ]

    var container = document.getElementById('motorizaciones_generacion');
    var table = document.createElement('table');
    var thead = document.createElement('thead');
    var tr_thead = document.createElement('tr');
    var tbody = document.createElement('tbody');

    headers.forEach(header => {
        var th = document.createElement('th');
        th.textContent = header;
        tr_thead.appendChild(th);
    });

    thead.appendChild(tr_thead);
    table.appendChild(thead);

    motorizations.forEach(motorization => {
        
        var tr_body = document.createElement('tr');
        // Luego pasa por este bloque if - else para comparar lo siguiente
        if (motorization.Combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
            var combustibleClass = motorization.cmbustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
        } else { // Si el combustible es cualquiera de los otros dos tipos
            var combustibleClass = motorization.combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
        }

        tr_body.innerHTML = `<td class='${combustibleClass}'>${motorization.codigoMotor}</td><td class='${combustibleClass}'>${motorization.periodoUso}</td>`;
        tbody.appendChild(tr_body);
    })

    table.appendChild(tbody);
    container.appendChild(table);
}