import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';
import 'package:hollow_bit/presentation/screens/base_screen/base_vm.dart';
import 'package:hollow_bit/presentation/screens/home_screen/widgets/_widgets.dart';

import '../../../data/model/wallet_model.dart';
import '../../shared/_shared.dart';

class Home2 extends ConsumerStatefulWidget {
  const Home2({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Home2> createState() => _Home2State();
}

class _Home2State extends ConsumerState<Home2> {
  List<Wallet> walletList = [
    Wallet(balance: "20.0", currency: 'NGN'),
    Wallet(
        balance: "100.0",
        currency: 'USD',
        color: ColorConstants.secondaryAccColor),
  ];

  @override
  Widget build(BuildContext context) {
    bool hasWallets = ref.read(baseViewModel).hasWallet;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 53.h, left: 20.0, right: 20.0),
      child: Column(
        children: [
          hasWallets ? const CustomAppBar() : const InfoCard(),
          SizedBox(
            height: 39.h,
          ),
          hasWallets ? const CardStack() : const EmptyCardStack(),
          SizedBox(
            height: 32.h,
          ),
          hasWallets
              ? const SizedBox.shrink()
              : Container(
                  height: 7.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: ColorConstants.success500,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
          SizedBox(
            height: 30.h,
          ),
          const ActionCard(),
          SizedBox(
            height: 38.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStylesConstants.headline1.copyWith(fontSize: 20),
              ),
              const Text(
                'see all',
                style: TextStylesConstants.seeAllText,
              ),
            ],
          ),
          hasWallets ? TransactionsList() : const NoTransactionsCard(),
        ],
      ),
    );
  }
}
