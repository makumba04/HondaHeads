const express = require('express');
const mysql = require('mysql2');
const api = express();

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: null, // Solo para trabajo en local, en caso contrario sustituir por la contraseña del user
    database: 'hondaAPI'
});

try {
    connection.connect(function(){

        $query = "SELECT * FROM Modelos";

        connection.query($query, function(err, rows, fields){
            if(err){
                console.log('La consulta no ha salio churra, algo has puesto mal');
                console.log(err);
                return
            } else {
                console.log('Todo correcto pichita', rows);
            }
        });
    });
} catch (e) {
    console.log('Algo a fallado en la conexión notas. Espabila');
    console.log(e);
}

api.use(express.static(__dirname + '/public'))
api.listen(3000, () => {
    console.log('API is up and running on port 3000!');
});