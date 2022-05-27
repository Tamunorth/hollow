import 'dart:developer';
import 'dart:math' as math;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/presentation/screens/home_screen/home_screen_vm.dart';

import '../../../../app/constants/_constants.dart';
import '_widgets.dart';

class CardStack extends ConsumerStatefulWidget {
  const CardStack({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CardStack> createState() => _CardStackState();
}

class _CardStackState extends ConsumerState<CardStack>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _animation;
  double dragPosition = 0;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addListener(() {
      setState(() {
        dragPosition = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final walletList = ref.read(homeScreenVM).walletList;

    final angle = dragPosition / 180 * math.pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateZ(angle);
    return IndexedStack(
      index: 0,
      alignment: Alignment.center,
      children: List.generate(
        walletList.length,
        (index) {
          return Stack(clipBehavior: Clip.none, children: [
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
                    color: walletList[index].currency == 'NGN'
                        ? ColorConstants.secondaryAccColor.withOpacity(0.6)
                        : ColorConstants.secondaryAccColorYellow
                            .withOpacity(0.6),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
            ),
            const FadedBlankCard(),
            SizedBox(
              height: 200,
              width: 340,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  setState(() {
                    dragPosition += details.delta.dy;
                    dragPosition %= 360;
                    log(dragPosition.toString());
                  });
                },
                onVerticalDragEnd: (details) {
                  log(dragPosition.toString());
                  double end = dragPosition > 10 ? 0 : 180;
                  _animation = Tween<double>(
                    begin: dragPosition,
                    end: end,
                  ).animate(_animationController);
                  _animationController.forward(from: 0);

                  setState(() {
                    walletList.add(walletList[index]);
                    log(index.toString());
                    walletList.removeAt(index);

                    log(index.toString());
                  });
                },
                child: Transform(
                  transform: transform,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      WalletCard(wallet: walletList[index]),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: 135,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: walletList[index].currency == 'NGN' ? 1 : 0,
                  decorator: DotsDecorator(
                    // color: ColorConstants.success500,
                    activeColor: ColorConstants.success500,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
