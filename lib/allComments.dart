import 'package:flutter/material.dart';
class AllComments extends StatelessWidget {
  const AllComments({
    Key key,
    @required this.fullVideoViewPortHeight,
    @required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final double fullVideoViewPortHeight;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    //Comments Section. Replace Content of Container according to your needs.
    return Positioned(
      bottom: 0,
      child: Container(
        height: fullVideoViewPortHeight * 0.6,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Align(
          child: ElevatedButton(
            onPressed: () {
              _controller.reverse(from: 1);
            },
            child: Text('Back'),
          ),
        ),
      ),
    );
  }
}