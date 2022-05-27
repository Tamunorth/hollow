import 'package:flutter/material.dart';

import '../../../../app/constants/_constants.dart';
import '../../../../app/dependencies/svg_dep.dart';
import '../../../../generated/assets.dart';

class ActionIcon extends StatelessWidget {
  final String imagePath;

  final String label;

  const ActionIcon({
    this.imagePath = Assets.imagesSendMoney,
    this.label = 'Send Money',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgAsset(imgPath: imagePath),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          label,
          style: TextStylesConstants.actionCardlabel,
        ),
      ],
    );
  }
}
