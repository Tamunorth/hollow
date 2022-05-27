import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/drop_down_item.dart';
import '../../../generated/assets.dart';

class CreateNewWalletVM extends ChangeNotifier {
  final List<DropDownItem> currencyDropDownItems = [
    DropDownItem(itemName: 'NGN', itemIcon: Assets.imagesNgn),
    DropDownItem(itemName: 'GHC', itemIcon: Assets.imagesGhc),
    DropDownItem(itemName: 'KES', itemIcon: Assets.imagesKes),
    DropDownItem(itemName: 'USD', itemIcon: Assets.imagesUsd),
    DropDownItem(itemName: 'GBP', itemIcon: Assets.imagesGbp),
    DropDownItem(itemName: 'EUR', itemIcon: Assets.imagesEur),
  ];

  final List<DropDownItem> walletDropDownItems = [
    DropDownItem(
      itemName: 'Crypto Wallet',
    ),
    DropDownItem(
      itemName: 'Fiat Wallet',
    ),
  ];
}

final createNewWalletVM =
    ChangeNotifierProvider<CreateNewWalletVM>((ref) => CreateNewWalletVM());
