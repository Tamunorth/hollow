import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountVM extends ChangeNotifier {
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final userNameEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final emailAddressEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
}

final createAccountVM =
    ChangeNotifierProvider<CreateAccountVM>((ref) => CreateAccountVM());
