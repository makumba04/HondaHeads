const express = require('express');
const mysql = require('mysql2');

const api = express();
const PORT = process.env.PORT || 3000;

api.use(express.json());

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

api.use(express.static(__dirname + '/public'))

api.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

api.get('/TodosMotores', (req, res) => {
  db.query('SELECT * FROM motores', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

api.get('/MotorPorCodigo/:CodigoMotor', (req, res) => {
  const { CodigoMotor } = req.params;
  db.query('SELECT * FROM motores WHERE CodigoMotor LIKE ?', [`${CodigoMotor}%`], (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

api.get('/ModeloPorID/:ModeloID', (req, res) => {
  const { ModeloID } = req.params;
  db.query('SELECT * FROM modelos WHERE ID = ?', [`${ModeloID}%`], (err, results) => {
    if (err) throw err;
    res.json(results[0]);
  });
});

api.get('/MotorizacionesPorID/:ModeloID', (req, res) => {
  const { ModeloID } = req.params;
  db.query('SELECT motorizaciones.PeriodoUso, motores.CodigoMotor, motores.Combustible FROM motorizaciones INNER JOIN motores ON motorizaciones.CodigoMotorID = motores.ID WHERE motorizaciones.ModeloID = ?', [ModeloID], (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});