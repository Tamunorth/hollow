import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hollow_bit/data/model/wallet_model.dart';

import '../../../../app/enums/swipe.dart';
import '_widgets.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.wallet,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final Wallet wallet;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  double dragPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 200.h,
            width: 335.w,
            child: ValueListenableBuilder(
              valueListenable: widget.swipeNotifier,
              builder: (context, swipe, _) {
                // final angle = dragPosition / 180 * pi;
                // final transform = Matrix4.identity()
                //   ..setEntry(3, 2, 0.001)
                //   ..rotateZ(angle);
                //
                // return Transform(
                //   transform: transform,
                //   child: Stack(
                //     clipBehavior: Clip.none,
                //     children: [
                //       WalletCard(wallet: widget.wallet),
                //     ],
                //   ),
                // );

                return RotationTransition(
                  turns: widget.swipeNotifier.value != Swipe.none
                      ? const AlwaysStoppedAnimation(45 / 360)
                      : const AlwaysStoppedAnimation(0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      WalletCard(wallet: widget.wallet),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width * 2.5 / 2) {
            widget.swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          widget.swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        //This will be visible when we press action button
        child: SizedBox(
          height: 200.h,
          width: 335.w,
          child: ValueListenableBuilder(
              valueListenable: widget.swipeNotifier,
              builder: (BuildContext context, Swipe swipe, Widget? child) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    WalletCard(wallet: widget.wallet),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
