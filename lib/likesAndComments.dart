import 'package:flutter/material.dart';

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
        Container(
          width: iconsHeight,
          height: iconsHeight,
          color: Colors.amber,
          child: Text('Likes'),
        ),
        Container(
          width: iconsHeight,
          height: iconsHeight,
          color: Colors.amber,
          child: Text('Comments'),
        ),
      ],
    );
  }
}