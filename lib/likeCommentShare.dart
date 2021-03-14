import 'package:flutter/material.dart';
import 'IconSvg.dart';

class LikeCommentShare extends StatelessWidget {
  const LikeCommentShare({
    Key key,
    @required this.iconsHeight,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final double iconsHeight;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconSvg(
          iconsHeight: iconsHeight,
          svgString: 'assets/svgs/like.svg',
        ),
        SizedBox(
          width: iconsHeight * 0.4,
        ),
        GestureDetector(
          child: IconSvg(
            iconsHeight: iconsHeight,
            svgString: 'assets/svgs/comment.svg',
          ),
          onTap: () {
            _controller.forward();
          },
        ),
        SizedBox(
          width: iconsHeight * 0.4,
        ),
        IconSvg(
          iconsHeight: iconsHeight,
          svgString: 'assets/svgs/send.svg',
        ),
      ],
    );
  }
}
