import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/constants/color_constants.dart';

class FadedBlankCard extends StatelessWidget {
  const FadedBlankCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Transform.rotate(
        angle: -0.139626,
        child: Container(
          height: 200.h,
          width: 335.w,
          decoration: BoxDecoration(
            color: ColorConstants.secondaryAccColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
