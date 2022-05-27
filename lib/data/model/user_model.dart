import 'package:hollow_bit/domain/entities/user_entity.dart';

class User implements UserEntity {
  @override
  final String? dollarAccBal;
  @override
  final String firstName;
  @override
  final String? nairaAccBal;

  User({
    required this.firstName,
    this.dollarAccBal,
    this.nairaAccBal,
  });
}
