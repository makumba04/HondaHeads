const express = require('express');
const api = express();

api.use(express.static(__dirname + '/public'))

api.listen(3000, () => {
    console.log('API is up and running on port 3000!');
});

// api.get('/', (req, res) => {
//     console.log(req);
//     res.send('Hello World!');
// });