import 'package:flutter/material.dart';

import '../../../../app/constants/_constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: ColorConstants.infoColor,
        border: Border.all(width: 1.0, color: ColorConstants.secondaryAccColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.info,
            color: ColorConstants.secondaryAccColor,
            size: 16.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              'Account verification pending. Features would be available once approved',
              style: TextStylesConstants.infoText,
            ),
          ),
        ],
      ),
    );
  }
}
