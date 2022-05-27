import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

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
