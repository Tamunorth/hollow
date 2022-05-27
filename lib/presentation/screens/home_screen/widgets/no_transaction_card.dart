import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/constants/_constants.dart';
import '../../../../app/dependencies/svg_dep.dart';
import '../../../../generated/assets.dart';

class NoTransactionsCard extends StatelessWidget {
  const NoTransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 68.h,
        ),
        const SvgAsset(imgPath: Assets.imagesNoTransaction),
        SizedBox(
          height: 20.h,
        ),
        const Text(
          'No transactions yet.',
          style: TextStylesConstants.noTransText,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
