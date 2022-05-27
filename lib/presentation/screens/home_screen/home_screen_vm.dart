import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants/color_constants.dart';
import '../../../data/model/wallet_model.dart';

class HomeScreenVM extends ChangeNotifier {
  List<Wallet> walletList = [
    Wallet(balance: "20.0", currency: 'NGN'),
    Wallet(
        balance: "100.0",
        currency: 'USD',
        color: ColorConstants.secondaryAccColor),
  ];
}

final homeScreenVM =
    ChangeNotifierProvider<HomeScreenVM>((ref) => HomeScreenVM());
