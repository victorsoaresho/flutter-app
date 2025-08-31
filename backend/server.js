const express = require('express');
const cors = require('cors');
const app = express();
const port = 3000;

// Middlewares essenciais que devem vir antes das rotas
app.use(cors());
app.use(express.json());

// "Banco de dados" em memória
const users = [];
let userIdCounter = 1;

// Dados de exemplo para as transações
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

// Rota para buscar transações (já estava correta)
app.get('/transactions', (req, res) => {
    console.log("Requisição recebida em /transactions");
    res.json(mockTransactions);
});

// Rota de registro de usuário
app.post('/register', (req, res) => {
    // CORREÇÃO 1: A variável estava como 'username', mas o app envia 'email'.
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ message: 'Email e senha são obrigatórios.' });
    }

    // A verificação de usuário existente estava correta.
    const userExists = users.find(user => user.email === email);
    if (userExists) {
        // CORREÇÃO 2: Retornar um código de status mais apropriado (409 Conflict).
        return res.status(409).json({ message: 'Este email já está em uso.' });
    }

    // CORREÇÃO 3: Precisamos criar o objeto 'newUser' antes de usá-lo.
    const newUser = {
        id: userIdCounter++,
        email: email,
        password: password, // Lembre-se: em um app real, a senha deve ser criptografada!
    };

    // CORREÇÃO 4: Devemos adicionar o 'newUser' ao array 'users'.
    users.push(newUser);
    console.log("Usuários cadastrados:", users);

    res.status(201).json({ message: 'Usuário criado com sucesso!', userId: newUser.id });
});

// Rota de login de usuário
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ message: 'Email e senha são obrigatórios.' });
    }

    // A lógica de busca do usuário estava correta.
    const user = users.find(user => user.email === email && user.password === password);
    if (!user) {
        return res.status(401).json({ message: 'Email ou senha inválidos.' });
    }

    res.status(200).json({ message: 'Login bem-sucedido!', userId: user.id });
});

// Inicia o servidor para aceitar conexões da rede local
app.listen(port, '0.0.0.0', () => {
    console.log(`Servidor rodando e pronto para receber conexões.`);
});