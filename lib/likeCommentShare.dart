import 'package:flutter/material.dart';
import 'IconSvg.dart';
import 'package:reels_ui_animation/scrollProvider.dart';
import 'package:provider/provider.dart';
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
    final myScrollProvider = Provider.of<ScrollProvider>(context, listen: false);
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
            //Disabling Scroll
            myScrollProvider.updateScrollable(scrollValue: false);
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
