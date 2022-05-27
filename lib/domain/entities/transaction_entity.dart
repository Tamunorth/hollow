class TransactionEntity {
  final String? imagePath;
  final String? date;
  final String? heading;
  final bool isDebit;
  final String? amount;

  TransactionEntity({
    this.imagePath,
    this.date,
    this.heading,
    required this.isDebit,
    this.amount,
  });
}
