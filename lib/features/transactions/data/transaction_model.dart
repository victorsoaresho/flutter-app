class TransactionModel {
  final String id;
  final String from;
  final String to;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.from,
    required this.to,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      from: json['from'],
      to: json['to'],
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date']),
    );
  }
}
