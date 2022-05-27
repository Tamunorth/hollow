import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';

import '../../app/constants/text_style_constants.dart';
import '../../domain/entities/drop_down_item.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key? key,
    required this.items,
    this.dropDownHeader = 'Select Country/ Currency',
    this.dropDownHint = 'Search Item',
    required this.onChanged,
  }) : super(key: key);
  final List<DropDownItem> items;
  final String dropDownHeader;
  final String dropDownHint;
  final void Function(String? value) onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropDownItem actionSelectedItem = DropDownItem(itemName: 'NGN', itemIcon: '');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.dropDownHeader,
          style: TextStylesConstants.textFieldLabel,
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField2(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorConstants.grey300),
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: ColorConstants.grey300),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          isExpanded: true,
          dropdownElevation: 3,

          hint: Text(
            widget.dropDownHint,
            style: TextStylesConstants.subHeadingItalic,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 30,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                  value: item.itemName,
                  child: Row(
                    children: [
                      item.itemIcon == null
                          ? const SizedBox.shrink()
                          : Image.asset(
                              item.itemIcon!,
                              height: 15,
                              width: 24,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        item.itemName,
                        style: TextStylesConstants.dropDownLabel1,
                      ),
                    ],
                  )))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select an Item';
            }
            return null;
          },

          ///NB without this Function UI doesen't update
          onChanged: widget.onChanged,

          onMenuStateChange: (value) {},
        ),
      ],
    );
  }
}
