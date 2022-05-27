import 'package:flutter/material.dart';

import '../../app/constants/_constants.dart';
import '../../app/dependencies/svg_dep.dart';
import '../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Hi, Raymond',
              style: TextStylesConstants.subHeading1,
            ),
            Text(
              'Welcome Back',
              style: TextStylesConstants.headline2,
            ),
          ],
        ),
        const SvgAsset(imgPath: Assets.imagesNotification)
      ],
    );
  }
}
