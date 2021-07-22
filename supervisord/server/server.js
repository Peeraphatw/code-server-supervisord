const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.status(200).json({ data: 'debuger' });
});

app.get('/user', (req, res) => {
  res.status(200).json({ data: 'peeraphat' });
});

app.post('/admin', (req, res) => {
  res.status(200).json({ data: req.params.id });
});

app.listen(3000, () => {
  console.log('server is running on port 3000');
});
