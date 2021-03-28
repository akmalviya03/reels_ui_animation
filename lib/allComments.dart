import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reels_ui_animation/scrollProvider.dart';
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
    final myScrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    //Comments Section. Replace Content of Container according to your needs.
    return SizedBox(
      height: fullVideoViewPortHeight * 0.6*_controller.value,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white,
        child: Align(
          child: ElevatedButton(
            onPressed: () {
              _controller.reverse(from: 1);
              myScrollProvider.updateScrollable(scrollValue: true);
            },
            child: Text('Back'),
          ),
        ),
      ),
    );
  }
}