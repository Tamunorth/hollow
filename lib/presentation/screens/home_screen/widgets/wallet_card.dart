import 'package:flutter/material.dart';

import '../../../../app/constants/_constants.dart';
import '../../../../app/dependencies/svg_dep.dart';
import '../../../../data/model/wallet_model.dart';
import '../../../../generated/assets.dart';

///This should be a custom widget but since i dont have access to the figma file to
///Group certina icons i just used the sttic card...
///BUt in realty this card will be dynamic

class WalletCard extends StatelessWidget {
  final Wallet wallet;

  const WalletCard({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -15,
      child: SvgAsset(
        imgPath: wallet.color == ColorConstants.secondaryAccColor
            ? Assets.imagesBlueCard
            : Assets.imagesYellowCard,
        height: 240,
      ),

      // Container(
      //   height: 200.h,
      //   width: 335.w,
      //   padding: EdgeInsets.all(24),
      //   decoration: BoxDecoration(
      //     color: wallet.color,
      //     borderRadius: BorderRadius.circular(24.0),
      //   ),
      //   child: Center(
      //     child: Column(
      //       children: <Widget>[
      //         Text('NGN Balance'),
      //         SvgAsset(imgPath: Assets.imagesAddSquare)
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
