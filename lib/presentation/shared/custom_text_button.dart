import 'package:flutter/material.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';

class CustomTextButton extends StatelessWidget {
  final bool isDisabled;
  final String title;
  final void Function()? onTap;
  final bool isInverted;

  const CustomTextButton({
    this.onTap,
    this.title = "Next",
    this.isDisabled = false,
    this.isInverted = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: isInverted
              ? TextStylesConstants.textButtonStyle.copyWith(
                  color: ColorConstants.primary600,
                )
              : TextStylesConstants.textButtonStyle,
        ),
        style: TextButton.styleFrom(
          backgroundColor: isInverted
              ? Colors.white
              : isDisabled
                  ? ColorConstants.primary200
                  : ColorConstants.primary600,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            side: isInverted
                ? const BorderSide(width: 1.0, color: ColorConstants.grey400)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
