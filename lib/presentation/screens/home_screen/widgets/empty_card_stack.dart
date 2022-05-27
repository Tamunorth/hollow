import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/constants/color_constants.dart';
import '../../create_new_wallet/create_new_wallet.dart';
import '_widgets.dart';

class EmptyCardStack extends StatelessWidget {
  const EmptyCardStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreateNewWalletScreen()));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const FadedBlankCard(),
          Container(
            height: 200.h,
            width: 335.w,
            decoration: BoxDecoration(
              color: ColorConstants.secondaryAccColor,
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          const DottedLineBox(),
        ],
      ),
    );
  }
}
