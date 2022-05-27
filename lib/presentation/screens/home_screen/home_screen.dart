import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_style_constants.dart';
import 'package:hollow_bit/app/dependencies/svg_dep.dart';
import 'package:hollow_bit/generated/assets.dart';
import 'package:hollow_bit/presentation/screens/home_screen/widgets/drag_widget.dart';

import '../../../app/enums/swipe.dart';
import '../../../data/model/wallet_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 53.h, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            decoration: BoxDecoration(
              color: ColorConstants.infoColor,
              border: Border.all(
                  width: 1.0, color: ColorConstants.secondaryAccColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const InfoCard(),
          ),
          SizedBox(
            height: 39.h,
          ),
          const CardStack(),
          SizedBox(
            height: 32.h,
          ),
          Container(
            height: 7.0,
            width: 30.0,
            decoration: BoxDecoration(
              color: ColorConstants.success500,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    ActionIcon(),
                    ActionIcon(),
                    ActionIcon(),
                  ],
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    ActionIcon(),
                    ActionIcon(),
                    ActionIcon(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStylesConstants.headline1.copyWith(fontSize: 20),
              ),
              const Text(
                'see all',
                style: TextStylesConstants.seeAllText,
              ),
            ],
          ),
          const NoTransactionsCard(),
        ],
      ),
    );
  }
}

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

class ActionIcon extends StatelessWidget {
  const ActionIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SvgAsset(imgPath: Assets.imagesSendMoney),
        SizedBox(
          height: 16.0,
        ),
        Text('Send Money'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class EmptyCardStack extends StatelessWidget {
  const EmptyCardStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class CardStack extends StatefulWidget {
  const CardStack({
    Key? key,
  }) : super(key: key);

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack>
    with SingleTickerProviderStateMixin {
  List<Wallet> walletList = [
    Wallet(balance: "20.0", currency: '5000'),
    Wallet(balance: "100.0", currency: '6000'),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // walletList.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ///Gives Definition to the stack
        const PlaceHolderCard(),
        Positioned(
          top: -20.0,
          left: 0,
          child: Transform.scale(
            scale: 0.85,
            origin: const Offset(50, 0),
            child: Container(
              height: 200.h,
              width: 335.w,
              decoration: BoxDecoration(
                color: ColorConstants.secondaryAccColorYellow.withOpacity(0.6),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
        ),
        const FadedBlankCard(),
        SizedBox(
          height: 200,
          width: 340,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(walletList.length, (index) {
                return PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                        const Rect.fromLTWH(0, 0, 580, 340),
                        const Size(580, 340)),
                    end: RelativeRect.fromSize(
                        Rect.fromLTWH(
                            swipe != Swipe.none ? -300 : 0, 0, 580, 340),
                        const Size(580, 340)),
                  ).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  )),
                  child: RotationTransition(
                    turns: Tween<double>(
                            begin: 0,
                            end: swipe != Swipe.none ? -0.1 * 0.3 : 0.0)
                        .animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: const Interval(0, 0.4, curve: Curves.easeInOut),
                      ),
                    ),
                    child: DragWidget(
                      wallet: walletList[index],
                      index: index - 1,
                      swipeNotifier: swipeNotifier,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),

        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 250.0,
                  width: 300.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                log(index.toString());

                walletList.add(walletList[index]);

                walletList.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}

// class WalletCard extends StatelessWidget {
//   final Wallet wallet;
//   const WalletCard({
//     Key? key,
//     required this.wallet,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 10,
//       child: Container(
//         height: 200.h,
//         width: 335.w,
//         padding: EdgeInsets.all(24),
//         decoration: BoxDecoration(
//           color: ColorConstants.secondaryAccColor,
//           borderRadius: BorderRadius.circular(24.0),
//         ),
//         child: Center(
//           child: Text(
//             wallet.balance,
//             style: TextStylesConstants.subHeading1,
//           ),
//         ),
//       ),
//     );
//   }
// }

class DottedLineBox extends StatelessWidget {
  const DottedLineBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          Assets.imagesDottedLine,
          height: 100,
          width: 175,
        ),
      ),
    );
  }
}

class PlaceHolderCard extends StatelessWidget {
  const PlaceHolderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}

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
