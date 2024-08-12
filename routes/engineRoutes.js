const express = require('express');
const mysql = require('mysql2');
require('dotenv').config()

const db = mysql.createPool({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_ROOT,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
});

const router = express.Router();

router.AllEngines = function(req, res) {
    db.query('SELECT * FROM motores', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
}

router.engineByCodename = function(req, res) {
    const { Codename } = req.params;
    db.query('SELECT * FROM motores WHERE CodigoMotor LIKE ?', [`${Codename}%`], (err, results) => {
      if (err) throw err;
      res.json(results);
    });
}

module.exports = router;