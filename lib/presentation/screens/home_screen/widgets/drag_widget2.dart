import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hollow_bit/data/model/wallet_model.dart';

import '../../../../app/enums/swipe.dart';
import '_widgets.dart';

class DragWidget2 extends StatefulWidget {
  const DragWidget2({
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
  State<DragWidget2> createState() => _DragWidget2State();
}

class _DragWidget2State extends State<DragWidget2> {
  double dragPosition = 0;

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateZ(angle);
    return Center(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            dragPosition -= details.delta.dx;
            dragPosition %= 360;
          });
        },
        onHorizontalDragEnd: (details) {},
        child: Transform(
          transform: transform,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              WalletCard(wallet: widget.wallet),
            ],
          ),
        ),
      ),
    );
  }
}
