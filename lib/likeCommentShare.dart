import 'package:flutter/material.dart';
class LikeCommentShare extends StatelessWidget {
  const LikeCommentShare({
    Key key,
    @required this.iconsHeight,
    @required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final double iconsHeight;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: iconsHeight,
          height: iconsHeight,
          color: Colors.amber,
          child: Text('Like'),
        ),
        GestureDetector(
          child: Container(
            width: iconsHeight,
            height: iconsHeight,
            color: Colors.amber,
            child: Text('Comment'),
          ),
          onTap: (){
            _controller.forward();
          },
        ),
        Container(
          width: iconsHeight,
          height: iconsHeight,
          color: Colors.amber,
          child: Text('Share'),
        ),
      ],
    );
  }
}