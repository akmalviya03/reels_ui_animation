import 'package:flutter/material.dart';
import 'IconSvg.dart';

class LikeCommentShare extends StatelessWidget {
  const LikeCommentShare({
    Key key,
    @required this.iconSize,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final double iconSize;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconSvg(
          iconsHeightAndWidth: iconSize,
          svgString: 'assets/svgs/like.svg',
        ),
        SizedBox(
          width: iconSize * 0.4,
        ),
        GestureDetector(
          child: IconSvg(
            iconsHeightAndWidth: iconSize,
            svgString: 'assets/svgs/comment.svg',
          ),
          onTap: () {
            _controller.forward();
          },
        ),
        SizedBox(
          width: iconSize * 0.4,
        ),
        IconSvg(
          iconsHeightAndWidth: iconSize,
          svgString: 'assets/svgs/send.svg',
        ),
      ],
    );
  }
}
