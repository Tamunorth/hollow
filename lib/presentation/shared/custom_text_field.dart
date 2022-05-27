import 'package:flutter/material.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';

class TextFieldBox extends StatefulWidget {
  final String label;
  final bool isTextObscured;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType keyBoardType;
  final bool hasBottomPadding;
  final String? Function(String?)? validator;
  final bool isEnabled;

  final Widget? prefixIcon;

  final bool isPasswordField;

  const TextFieldBox({
    Key? key,
    required this.label,
    this.isEnabled = true,
    this.isTextObscured = false,
    required this.controller,
    this.hintText,
    this.keyBoardType = TextInputType.name,
    this.hasBottomPadding = false,
    this.validator,
    this.isPasswordField = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<TextFieldBox> createState() => _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {
  bool onChanged = false;
  bool showPasswordText = false;
  bool showIcon = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        onChanged
            ? Text(
                widget.label,
              )
            : const SizedBox.shrink(),
        Container(
          padding: widget.hasBottomPadding
              ? const EdgeInsets.only(bottom: 8.0, top: 5.0)
              : const EdgeInsets.only(bottom: 30.0, top: 5.0),
          child: TextFormField(
            enabled: widget.isEnabled,
            validator: widget.validator,
            // onSubmitted: (value) {
            //   print(value);
            //   controller.text = value;
            // },

            onTap: () {
              setState(() {
                onChanged = true;
              });

              if (widget.isPasswordField) {
                setState(() {
                  showPasswordText = true;
                });
              }
              if (widget.prefixIcon != null) {
                setState(() {
                  showIcon = true;
                });
              }
            },
            keyboardType: widget.keyBoardType,
            controller: widget.controller,
            obscureText: widget.isTextObscured,
            obscuringCharacter: '*',
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: showIcon ? widget.prefixIcon : null,
              hintStyle: const TextStyle(
                color: Color(0xff999999),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: ColorConstants.success500),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorConstants.grey300),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorConstants.grey300),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        ),
        showPasswordText
            ? Column(
                children: const <Widget>[
                  CheckedText('Must be 8 charcters at least'),
                  CheckedText('Must contain a special character'),
                  CheckedText('Must contain a number at least'),
                ],
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: widget.hasBottomPadding ? 40.0 : 0.0,
        ),
      ],
    );
  }
}

class CheckedText extends StatelessWidget {
  final String text;
  const CheckedText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.check_circle_outline,
          color: ColorConstants.success500,
          size: 20.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          text,
          style: TextStylesConstants.subScriptText2,
        ),
      ],
    );
  }
}
