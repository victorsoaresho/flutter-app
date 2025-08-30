import 'package:flutter/material.dart'; 
import 'features/transactions/ui/transactions_page.dart';

void main() {
  runApp(const BankApp());
}

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TransactionsPage(),
      );
  }
}