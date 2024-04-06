// Definición de constantes
const express = require('express'); // Express: Llama a la libreria de Express.js
const mysql = require('mysql2'); // MySQL: Llama a la libreria de MySQL2
const path = require('path');

// Inicializar la app
const app = express()
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.static(__dirname + '/public'))

// Cargar el motor de templates
app.set('views', __dirname + '/views');
app.set('view engine', 'pug');

// Inicio del servidor

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

// Conexión a base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'hondaAPI',
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

// Rutas

  // Home
  app.get('/', function(req, res){
    res.render('index');
  });

  // API

  app.get('/TodosMotores', (req, res) => {
    db.query('SELECT * FROM motores', (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

  app.get('/MotorPorCodigo/:CodigoMotor', (req, res) => {
    const { CodigoMotor } = req.params;
    db.query('SELECT * FROM motores WHERE CodigoMotor LIKE ?', [`${CodigoMotor}%`], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

  app.get('/ModeloPorID/:ModeloID', (req, res) => {
    const { ModeloID } = req.params;
    db.query('SELECT * FROM modelos WHERE ID = ?', [`${ModeloID}%`], (err, results) => {
      if (err) throw err;
      res.json(results[0]);
    });
  });

  app.get('/MotorizacionesPorID/:ModeloID', (req, res) => {
    const { ModeloID } = req.params;
    db.query('SELECT motorizaciones.PeriodoUso, motores.CodigoMotor, motores.Combustible FROM motorizaciones INNER JOIN motores ON motorizaciones.CodigoMotorID = motores.ID WHERE motorizaciones.ModeloID = ?', [ModeloID], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });