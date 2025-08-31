import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/transactions/data/transaction_model.dart';

class ApiService {
  final String baseUrl = "http://192.168.12.8:3000"; // sua API Node

  Future<List<TransactionModel>> getTransactions() async {
    final response = await http.get(Uri.parse("$baseUrl/transactions"));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => TransactionModel.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao buscar transações");
    }
  }

  Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  Future<http.Response> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'), // Aponta para a nova rota /register
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }
}
