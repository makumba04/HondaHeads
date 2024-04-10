// Definición de constantes
const express = require('express'); // Express: Llama a la libreria de Express.js
const mysql = require('mysql2'); // MySQL: Llama a la libreria de MySQL2

// Inicializar la app
const app = express()
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.static(__dirname + '/public'));

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
    db.query('SELECT id, nombreModelo, rutaPortada, periodo FROM modelos', (err, results) => {
      if (err) throw err;
      res.render('index', {
        title: 'modelos',
        modelos: results
      });
    });
  });

  // Models
  app.get('/model/:id', function(req, res){
    const {id} = req.params;
    db.query('SELECT modelos.nombreModelo, modelos.intro, modelos.historia, modelos.legado, generaciones.rutaPortada, generaciones.nombreGeneracion, generaciones.periodo FROM modelos INNER JOIN generaciones ON modelos.id = generaciones.modelo_id WHERE modelos.id = ?', [id], (err, results) => {
      if (err) throw err;
      res.render('ModelTemplate', {
        title: 'modelo',
        modelo: results
      });
    })
  });

  // Generations
  app.get('/generations/:generation_id', function(req, res){
    const generation_id = req.params.generation_id;
    res.render('GenerationTemplate', { generation_id: generation_id});
  });


  app.get('/modelById/:id', (req, res) => { // Función 'modelById': Saca los datos guardados en la bd de un modelo a través de su ID
    const {id} = req.params;
    db.query('SELECT * FROM modelos WHERE id = ?', [id], (err, results) => {
      if (err) throw err;
      res.json(results[0]);
    })
  });

  app.get('/generationsPerModel/:model_id', (req, res) => { // Función 'generationsPerModel': Saca los datos de todas las generaciones asociadas a un modelo
    const {model_id} = req.params;
    db.query('SELECT g.* FROM modelos as m INNER JOIN generaciones as g ON m.id = g.modelo_id WHERE m.id = ?;', [model_id], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

  app.get('/generationInfo/:id', (req, res) => { // Función 'generationInfo': Saca los datos de una generación por su ID
    const { id } = req.params;
    db.query('SELECT * FROM generaciones WHERE ID = ?', [id], (err, results) => {
      if (err) throw err;
      res.json(results[0]);
    });
  });

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

  app.get('/MotorizacionesPorID/:ModeloID', (req, res) => {
    const { ModeloID } = req.params;
    db.query('SELECT motorizaciones.PeriodoUso, motores.CodigoMotor, motores.Combustible FROM motorizaciones INNER JOIN motores ON motorizaciones.CodigoMotorID = motores.ID WHERE motorizaciones.ModeloID = ?', [ModeloID], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });