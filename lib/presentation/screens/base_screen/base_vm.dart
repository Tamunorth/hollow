import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hollow_bit/data/model/user_model.dart';

class BaseScreenViewModel extends ChangeNotifier {
  String get userName => _currentUser?.firstName ?? '';

  bool hasWallet = false;

  User? _currentUser;

  toggleWalletStatus(bool hasWallet) {
    hasWallet = hasWallet;
  }

  storeUser(User appUser) {
    _currentUser = appUser;
  }

  User? getUser() {
    return _currentUser;
  }
}

final baseViewModel =
    ChangeNotifierProvider<BaseScreenViewModel>((ref) => BaseScreenViewModel());
