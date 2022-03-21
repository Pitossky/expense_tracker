class TransactionModel {
  final String transactionId;
  final String transactionTitle;
  final double transactionAmount;
  final DateTime transactionDate;

  TransactionModel({
    required this.transactionId,
    required this.transactionTitle,
    required this.transactionAmount,
    required this.transactionDate,
  });
}
