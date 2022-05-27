import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';
import 'package:hollow_bit/generated/assets.dart';
import 'package:hollow_bit/presentation/screens/base_screen/base_screen.dart';
import 'package:hollow_bit/presentation/screens/base_screen/base_vm.dart';
import 'package:hollow_bit/presentation/screens/create_new_wallet/create_new_wallet_vm.dart';
import 'package:hollow_bit/presentation/shared/custom_drop_down_botton.dart';
import 'package:hollow_bit/presentation/shared/custom_text_button.dart';

class CreateNewWalletSelectCurrency extends ConsumerStatefulWidget {
  const CreateNewWalletSelectCurrency({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateNewWalletSelectCurrency> createState() =>
      _CreateNewWalletSelectCurrencyState();
}

class _CreateNewWalletSelectCurrencyState
    extends ConsumerState<CreateNewWalletSelectCurrency> {
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    final currencyDropDownItems =
        ref.read(createNewWalletVM).currencyDropDownItems;
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
                    'Please fill in the details to create your wallet.',
                    style: TextStylesConstants.subHeading1,
                  ),
                  SizedBox(
                    height: 32.0.h,
                  ),
                  CustomDropDown(
                    items: currencyDropDownItems,
                    onChanged: (value) {
                      setState(() {
                        isReady = true;
                      });
                      log('Selected value called');
                    },
                  ),
                ],
              ),
            ),
            CustomTextButton(
              title: 'Create Wallet',
              isDisabled: !isReady,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.0),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      height: 395.h,
                      padding: EdgeInsets.only(
                          bottom: 40.h, left: 20.w, right: 20.w, top: 24.h),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.imagesSuccessIcon, height: 70.h),
                          Column(
                            children: const [
                              Text(
                                'Succesful!',
                                style: TextStylesConstants.bottomSheetHeading,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                'Your wallet has been created successfully.!',
                                style: TextStylesConstants.subHeading1,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const CustomTextButton(
                                title: 'Fund Wallet',
                              ),
                              const SizedBox(height: 12.0),
                              CustomTextButton(
                                title: 'Back to Home',
                                isInverted: true,
                                onTap: isReady
                                    ? () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);

                                        ref.read(baseViewModel).hasWallet =
                                            true;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BaseScreen()));
                                      }
                                    : () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
