function buscarMotores() { // Función buscarMotores: Busca los motores en la base de datos

    var CodigoMotor = document.getElementById('CodigoMotor').value.toUpperCase(); // Guarda el valor del input donde se pone el codigo de motor
    // var filtro = document.getElementById('filtro').value; EL FILTRO AUN NO FUNCIONA

    // Primero pasa por este bloque if - else que compara las siguientes condicionales

    if (CodigoMotor == '') {// Si la variable anteriormente guardada tiene un valor vacio (es decir, no se ha escrito nada en el input) y no existe filtro

        fetch(`http://localhost:3000/TodosMotores`) // El programa llama por URL al método de buscar todos los motores en la API
        .then(response => response.json()) // Guarda la respuesta en formato JSON
        .then(data => { // Luego hace las siguientes acciones con los datos...
            console.log(data); // Primero la muestra en la consola (Esto desaparecerá en algún momento cuando termine el desarrollo de la web)
            mostrarTodosMotores(data); // Luego llama al método mostrarMotorPorCodigo enviandole los datos recibidos para que haga su función
        })
        .catch(error => console.error('Error:', error)); // Si ocurre algún tipo de error en el proceso lo envía a la consola
    } else { // En el caso de si tener un input, se realiza lo siguiente

        fetch(`http://localhost:3000/MotorPorCodigo/${CodigoMotor}`) // Se llama a la función de búsqueda del motor por su código correspondiente
        .then(response => response.json()) // Guarda la respuesta en formato JSON
        .then(data => { // Luego hace las siguientes acciones con los datos...
            console.log(data); // Primero la muestra en la consola (Esto desaparecerá en algún momento cuando termine el desarrollo de la web)
            mostrarMotorPorCodigo(data, CodigoMotor); // Luego llama al método mostrarTodosMotores enviandole los datos recibidos para que haga su función
        })
        .catch(error => console.error('Error:', error)); // Si ocurre algún tipo de error en el proceso lo envía a la consola
    }
}

function datosModelo(ModeloID){
    buscarModelo(ModeloID);
    buscarMotorizaciones(ModeloID);
}

function buscarModelo(ModeloID){
    fetch(`http://localhost:3000/ModeloPorID/${ModeloID}`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        mostrarDatosModelo(data);
    })
    .catch(error => console.error('Error:', error));
}

function buscarMotorizaciones(ModeloID) {

    fetch(`http://localhost:3000/MotorizacionesPorID/${ModeloID}`)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        mostrarMotorizaciones(data);
    })
    .catch(error => console.error('Error:', error));
}

function mostrarTodosMotores(motores){ // Función mostrarTodosMotores: Recibe los datos de la función de busqueda para mostrarlos en una tabla

    var tablaMotor = document.getElementById('tabla_motor'); // Primero crea un handler para el contenedor de la tabla

    if(motores){ // Primero verifica si se ha encontrado un motor

        if(motores.length > 0){ // Como los datos JSON (cuando son varios) llegan en forma de array, primero verifica que al menos haya más de uno
        
            // Luego crea un nuevo elemento llamado tabla y le inserta el código por escrito para generar dicha tabla
            var tabla = "<table id='motores'><thead><tr><th>Combustible</th><th>Código de Motor</th><th>Tipo de motor</th><th>Cilindrada</th><th>Relación de compresión</th><th>Diametro y carrera</th><th>Potencia máxima</th><th>Par máximo</th></tr></thead><tbody>";
    
            motores.forEach(motor => { // Luego usando el método de String "forEach()" itera sobre cada uno de los subarrays dentro del array de motores que recibe en JSON
    
                // Luego pasa por este bloque if - else para comparar lo siguiente
                if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
                    var combustibleClass = motor.Combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
                } else { // Si el combustible es cualquiera de los otros dos tipos
                    var combustibleClass = motor.Combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
                }
    
                // Luego genera una tabla con todos los datos necesarios para crear dicha fila de datos sobre el motor en esa iteración
                tabla += `<tr><td class='${combustibleClass}'>${motor.Combustible}</td><td class='${combustibleClass}'>${motor.CodigoMotor}</td><td class='${combustibleClass}'>${motor.TipoMotor}</td><td class='${combustibleClass}'>${motor.Cilindrada}</td><td class='${combustibleClass}'>${motor.RelacionCompresion}</td><td class='${combustibleClass}'>${motor.DiametroCarrera}</td><td class='${combustibleClass}'>${motor.PotenciaMaxima}</td><td class='${combustibleClass}'>${motor.ParMaximo}</td></tr>`;
            });
    
            tabla += "</tbody></table>"; // Finalmente, cuando ha terminado de iterar sobre los datos recibidos cierra con estas dos etiquetas de cierre para la tabla
            tablaMotor.innerHTML = tabla; // Luego añade todo el código al HTML interno de la tabla para que lo coteje como código y no texto simple
        } else { // En caso de no recibir ni un solo dato del JSON
            tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron motores en la base de datos</p>`; // ...muestra un mensaje de advertencia
        }
    }
}

function mostrarMotorPorCodigo(motores, CodigoMotor){ // Función mostrarMotorPorCodigo: Recibe dos líneas de datos, la primera es el JSON con los datos del motor y la segunda es el código de motor específico

    var tablaMotor = document.getElementById('tabla_motor'); // Se crea un handler para el contenedor de que recoge a la tabla

    if(motores){ // Primero verifica si se ha encontrado un motor

        if(motores.length > 0){ // Luego verifica si el array de motores es al menos mayor que 0 (Lo que significa que ha encontrado al menos una coincidencia)

            // Se crea un handler para generar la tabla con los datos del motor específico, tambien se añade la clase de cada td según el combustible que use
            var tabla = "<table id='motores'><thead><tr><th>Combustible</th><th>Código de Motor</th><th>Tipo de motor</th><th>Relación de compresión</th><th>Diametro y carrera</th><th>Potencia máxima</th><th>Par máximo</th></tr></thead><tbody>";

            motores.forEach(motor => {

                // Luego se pasa por este bloque if - else para comparar la siguiente condición
                if (motor.combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
                    var combustibleClass = motor.Combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
                } else { // Si el combustible es cualquiera de los otros dos tipos
                    var combustibleClass = motor.Combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
                }

                // Luego se crea el código para generar la parte de la tabla que muestra la información del motor buscado
                tabla += `<tr><td class='${combustibleClass}'>${motor.Combustible}</td><td class='${combustibleClass}'>${motor.CodigoMotor}</td><td class='${combustibleClass}'>${motor.TipoMotor}</td><td class='${combustibleClass}'>${motor.RelacionCompresion}</td><td class='${combustibleClass}'>${motor.DiametroCarrera}</td><td class='${combustibleClass}'>${motor.PotenciaMaxima}</td><td class='${combustibleClass}'>${motor.ParMaximo}</td></tr>`;
            })
            tabla += "</tbody></table>"; // Luego se cierra con las etiquetas de cierre de la tabla

            tablaMotor.innerHTML = tabla; // Se agrega al HTML interno la tabla generada
        } else { // En caso de recibir el array vacio (Lo que significa no encontrar ni una sola coincidencia)...
            tablaMotor.innerHTML = `<p style="margin-top: 2%;">No se encontraron datos para el código de motor '${CodigoMotor}'</p>`; // ...muestra un mensaje de advertencia
        }
    }
}

function mostrarDatosModelo(modelo) {
    var container = document.getElementById('datos_modelo');

    var data_list = "<ul>";
    data_list += `<li>Longitud de chasis: ${modelo.LongitudChasis}</li><li>Peso: ${modelo.Peso}</li><li>Transmision ${modelo.Transmision}</li>`;
    data_list += "</ul>";

    container.innerHTML = data_list;
}



function mostrarMotorizaciones(motorizaciones) {
    
    var tabla = document.getElementById('tabla_motorizaciones');
    var datos = "<table><tbody><tr><td>Código de motor</td><td>Periodo de uso</td></tr>";

    motorizaciones.forEach(motorizacion => {
        
        // Luego pasa por este bloque if - else para comparar lo siguiente
        if (motorizacion.Combustible == "Hibrido / Gasolina") { // Si el combustible del motor es híbrido de gasolina
            var combustibleClass = motorizacion.Combustible.slice(0, 7).toLowerCase(); // Convierte el input de texto en minúsculas y se queda solo con la palabra hibrido para el CSS
        } else { // Si el combustible es cualquiera de los otros dos tipos
            var combustibleClass = motorizacion.Combustible.toLowerCase(); // Simplemente lo pasa a minúsculas
        }

        datos += `<tr><td class='${combustibleClass}'>${motorizacion.CodigoMotor}</td><td class='${combustibleClass}'>${motorizacion.PeriodoUso}</td></tr>`;
    })

    datos += "</tbody></table>";

    tabla.innerHTML = datos;
}