const express = require('express');
const mysql = require('mysql2');
require('dotenv').config()

const app = express()

const modelRoutes = require('./routes/modelRoutes');
const engineRoutes = require('./routes/engineRoutes');
const generationRoutes = require('./routes/generationRoutes');

app.use('/engines', engineRoutes);
app.use(express.json());
app.use(express.static(__dirname + '/public'));
app.set('views', __dirname + '/views');
app.set('view engine', 'pug');

app.listen(3000, ()=> {
  console.log('Server up and running')
});

// Conexión a base de datos
const db = mysql.createPool({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_ROOT,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE
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
  app.get('/showModel/:id', modelRoutes.showModel);
  app.get('/modelMonoGen/:id', modelRoutes.showModelMonoGen);
  app.get('/showModelData/:generation_id', modelRoutes.showModelData);

  // Generations
  app.get('/showGenerationData/:generation_id', generationRoutes.showGenerationData);
  app.get('/showGenerationById/:generation_id', generationRoutes.showGenerationById);
  app.get('/showAllMotorizations/:generation_id', generationRoutes.showAllMotorizations);

  // Engines

  app.get('/showAllEngines', engineRoutes.AllEngines);
  app.get('/engineByCodename/:Codename', engineRoutes.engineByCodename);