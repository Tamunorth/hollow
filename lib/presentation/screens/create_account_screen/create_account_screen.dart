import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';
import 'package:hollow_bit/app/dependencies/svg_dep.dart';
import 'package:hollow_bit/generated/assets.dart';
import 'package:hollow_bit/presentation/screens/base_screen/base_screen.dart';
import 'package:hollow_bit/presentation/screens/create_account_screen/create_account_vm.dart';
import 'package:hollow_bit/presentation/shared/custom_text_button.dart';
import 'package:hollow_bit/presentation/shared/custom_text_field.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  bool checked = false;
  // bool isReady = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(createAccountVM);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
                right: 0.0,
                top: 0.0,
                child: SvgAsset(imgPath: Assets.imagesCreateAccArrow)),
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 84.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create a new \nAccount',
                      style: TextStylesConstants.headline1,
                    ),
                    SizedBox(height: 12.0.h),
                    const Text(
                      'We’re glad you’re here. Please create your \naccount in a few steps.',
                      style: TextStylesConstants.subHeading1,
                    ),
                    SizedBox(height: 40.h),
                    TextFieldBox(
                      controller: vm.nameEditingController,
                      label: 'First Name and Middle Name',
                      hintText: 'First Name and Middle Name',
                    ),
                    TextFieldBox(
                      controller: vm.lastNameEditingController,
                      label: 'Last Name',
                      hintText: 'Last Name',
                    ),
                    TextFieldBox(
                      controller: vm.userNameEditingController,
                      label: 'Preferred Name/ Username',
                      hintText: 'Preferred Name/ Username',
                    ),
                    TextFieldBox(
                      controller: vm.phoneNumberEditingController,
                      label: 'Phone Number',
                      hintText: 'Phone Number',
                      prefixIcon: Image.asset(
                        Assets.imagesNgnSmall,
                      ),
                    ),
                    TextFieldBox(
                      controller: vm.emailAddressEditingController,
                      label: 'Email Address',
                      hintText: 'Email Address',
                    ),
                    TextFieldBox(
                      controller: vm.passwordEditingController,
                      label: 'Password',
                      hintText: 'Password',
                      hasBottomPadding: true,
                      isPasswordField: true,
                      isTextObscured: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff292D32),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              checked = !checked;
                            });
                          },
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: ColorConstants.success500),
                              borderRadius:
                                  BorderRadiusDirectional.circular(6.0),
                            ),
                            child: !checked
                                ? const SizedBox.shrink()
                                : const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: ColorConstants.success500,
                                      size: 17,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: 'I have read and agree to Chagera’s ',
                              style: TextStylesConstants.subScriptText1,
                              children: [
                                TextSpan(
                                    text: ' Terms of Service, Privacy Policy',
                                    style: TextStylesConstants.subScriptText2),
                                TextSpan(text: ' and'),
                                TextSpan(
                                    text: ' Card Holder Agreement.',
                                    style: TextStylesConstants.subScriptText2),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 73.h,
                    ),
                    CustomTextButton(
                        title: 'Create My Account',
                        isDisabled: !checked,
                        onTap: checked
                            ? () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BaseScreen(),
                                  ),
                                );
                              }
                            : () {}),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: const TextSpan(
                          text: 'Got an account? ',
                          style: TextStylesConstants.subScriptText1,
                          children: [
                            TextSpan(
                                text: ' Sign in',
                                style: TextStylesConstants.subScriptText2),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
