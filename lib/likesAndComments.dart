import 'package:flutter/material.dart';

import 'IconSvg.dart';

class LikesAndComments extends StatelessWidget {
  const LikesAndComments({
    Key key,
    @required this.iconsHeight,
  }) : super(key: key);

  final double iconsHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconSvg(
              iconsHeight: iconsHeight*0.7,
              svgString: 'assets/svgs/like.svg',
            ),
            Text(
              ' 230k',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: iconsHeight*0.7),
            ),
          ],
        ),
        SizedBox(width: iconsHeight * 0.7,),
        Row(
          children: [
            IconSvg(
              iconsHeight: iconsHeight*0.7,
              svgString: 'assets/svgs/comment.svg',
            ),
            Text(
              ' 145k',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: iconsHeight*0.7),
            ),
          ],
        ),
      ],
    );
  }
}