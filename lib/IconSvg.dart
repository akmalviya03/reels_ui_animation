
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class IconSvg extends StatelessWidget {
  final iconsHeight;
  final svgString;
  IconSvg({@required this.iconsHeight, @required this.svgString});
  @override
  Widget build(BuildContext context) {
    return WebsafeSvg.asset(
      svgString,
      width: iconsHeight,
      height: iconsHeight,
      color: Colors.grey,
    );
  }
}