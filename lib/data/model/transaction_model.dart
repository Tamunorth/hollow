import 'package:hollow_bit/domain/entities/transaction_entity.dart';
import 'package:hollow_bit/generated/assets.dart';

class Transaction implements TransactionEntity {
  @override
  final String imagePath;
  @override
  final String date;
  @override
  final String heading;
  @override
  final bool isDebit;
  @override
  final String amount;

  Transaction({
    this.imagePath = Assets.imagesSpotify,
    required this.date,
    required this.heading,
    this.isDebit = false,
    required this.amount,
  });
}
