import 'dart:ui';

import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/domain/entities/wallet_entity.dart';

class Wallet implements WalletEntity {
  @override
  final String balance;
  @override
  final String currency;
  final Color color;

  Wallet({
    required this.balance,
    required this.currency,
    this.color = ColorConstants.secondaryAccColorYellow,
  });
}
