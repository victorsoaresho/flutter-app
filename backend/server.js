const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

const mockTransactions = [
    {
    id: "1",
    from: "Alice",
    to: "Bob",
    amount: 150.75,
    date: "2025-08-28T10:00:00Z",
  },
  {
    id: "2",
    from: "Charlie",
    to: "Alice",
    amount: 200.00,
    date: "2025-08-29T14:30:00Z",
  },
  {
    id: "3",
    from: "Bob",
    to: "David",
    amount: 75.50,
    date: "2025-08-30T09:15:00Z",
  },
];

app.get('/transactions', (req, res) => {
    console.log("Requisição recebida em /transactions");
    res.json(mockTransactions);
});

app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});