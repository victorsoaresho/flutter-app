import 'package:flutter/material.dart';
import '../../../services/api_service.dart';
import '../data/transaction_model.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final ApiService api = ApiService();
  late Future<List<TransactionModel>> futureTransactions;

  @override
  void initState() {
    super.initState();
    futureTransactions = api.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transações Bancárias")),
      body: FutureBuilder<List<TransactionModel>>(
        future: futureTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhuma transação encontrada."));
          }

          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final t = transactions[index];
              return ListTile(
                title: Text("${t.from} → ${t.to}"),
                subtitle: Text("R\$ ${t.amount.toStringAsFixed(2)}"),
                trailing: Text(
                  "${t.date.day}/${t.date.month}/${t.date.year}",
                  style: const TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }
}