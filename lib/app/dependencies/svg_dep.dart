
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

///This class exists to abstract aay the SVG package so if there is ever a problem with said package
///We can change package implementations here

class SvgAsset extends StatelessWidget {
  final String imgPath;
  final Color? color;
  final bool isLocal;
  final double? height;
  final double? width;

  const SvgAsset(
      {Key? key,
      required this.imgPath,
      this.color,
      this.isLocal = true,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLocal
        ? SvgPicture.asset(
            imgPath,
            color: color,
            height: height,
            width: width,
          )
        : SvgPicture.network(
            imgPath,
            color: color,
          );
  }
}
