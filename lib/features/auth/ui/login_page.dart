import 'package:flutter/material.dart';
import '../../../services/api_service.dart'; // Vamos precisar do serviço
import '../../transactions/ui/transactions_page.dart'; // Para navegar após o login
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Chave para identificar e validar nosso formulário
  final _formKey = GlobalKey<FormState>();

  // Controladores para ler o texto dos campos de email e senha
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Instância do nosso serviço de API
  final ApiService _apiService = ApiService();
  
  // Variável para controlar o estado de carregamento
  bool _isLoading = false;

  @override
  void dispose() {
    // Limpa os controladores quando o widget é descartado para liberar memória
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  // Função que será chamada quando o botão for pressionado
  Future<void> _login() async {
    // Primeiro, verifica se o formulário é válido (campos preenchidos, etc.)
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Inicia o indicador de carregamento
      });

      try {
        // Chama o método de login da API (que vamos criar no próximo passo)
        final response = await _apiService.login(
          _emailController.text,
          _passwordController.text,
        );

        // Verifica se a resposta da API foi um sucesso (código 200)
        if (response.statusCode == 200) {
          // Navega para a tela de transações e remove a tela de login da pilha
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TransactionsPage()),
          );
        } else {
          // Mostra uma mensagem de erro se o login falhar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email ou senha inválidos.')),
          );
        }
      } catch (e) {
        // Mostra uma mensagem de erro genérica se algo der errado na comunicação
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao conectar ao servidor: $e')),
        );
      } finally {
        // Garante que o indicador de carregamento pare, independentemente do resultado
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bank App - Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16), // Espaçamento
              // Campo de Senha
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Esconde o texto da senha
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Botão de Login
              // Se estiver carregando, mostra um CircularProgressIndicator, senão, mostra o botão
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Entrar'),
                    ),
              
              const SizedBox(height: 8), // Um pequeno espaço

              // --- BOTÃO NOVO PARA NAVEGAR PARA O REGISTRO ---
              TextButton(
                onPressed: () {
                  // Navega para a tela de registro
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('Não tem uma conta? Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}