import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';
import 'package:hollow_bit/presentation/screens/create_new_wallet/create_new_wallet_select_currency.dart';
import 'package:hollow_bit/presentation/screens/create_new_wallet/create_new_wallet_vm.dart';
import 'package:hollow_bit/presentation/shared/custom_drop_down_botton.dart';
import 'package:hollow_bit/presentation/shared/custom_text_button.dart';

class CreateNewWalletScreen extends ConsumerStatefulWidget {
  const CreateNewWalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateNewWalletScreen> createState() =>
      _CreateNewWalletScreenState();
}

class _CreateNewWalletScreenState extends ConsumerState<CreateNewWalletScreen> {
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    final walletDropDownItems = ref.read(createNewWalletVM).walletDropDownItems;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 20, right: 20.0, top: 72.h, bottom: 40.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  SizedBox(
                    height: 32.0.h,
                  ),
                  const Text(
                    'Create New Wallet',
                    style: TextStylesConstants.headline2,
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  const Text(
                    'What type of wallet do you want to create?',
                    style: TextStylesConstants.subHeading1,
                  ),
                  SizedBox(
                    height: 32.0.h,
                  ),
                  CustomDropDown(
                    items: walletDropDownItems,
                    onChanged: (value) {
                      setState(() {
                        isReady = true;
                      });
                      log('Selected value called');
                    },
                  )
                ],
              ),
            ),
            CustomTextButton(
              title: 'Proceed',
              isDisabled: !isReady,
              onTap: isReady
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateNewWalletSelectCurrency(),
                        ),
                      );
                    }
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}
