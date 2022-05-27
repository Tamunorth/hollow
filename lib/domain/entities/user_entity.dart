class UserEntity {
  final String firstName;
  final String? nairaAccBal;
  final String? dollarAccBal;

  UserEntity({
    required this.firstName,
    this.dollarAccBal,
    this.nairaAccBal,
  });
}
