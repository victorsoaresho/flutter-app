import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/transactions/data/transaction_model.dart';

class ApiService {
  final String baseUrl = "http://localhost:3000"; // sua API Node

  Future<List<TransactionModel>> getTransactions() async {
    final response = await http.get(Uri.parse("$baseUrl/transactions"));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => TransactionModel.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao buscar transações");
    }
  }
}
