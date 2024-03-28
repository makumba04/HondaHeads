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

api.get('/modelos', (req, res) => {
  db.query('SELECT * FROM modelos', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

api.get('/motores', (req, res) => {
  db.query('SELECT * FROM motores', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

api.get('/motorizaciones', (req, res) => {
  db.query('SELECT * FROM motorizaciones', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Get a user by ID
/* app.get('/users/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM users WHERE id = ?', [id], (err, results) => {
    if (err) throw err;
    res.json(results[0]);
  });
}); */