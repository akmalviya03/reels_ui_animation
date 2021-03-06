import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:provider/provider.dart';
import 'package:reels_ui_animation/scrollProvider.dart';
import 'package:reels_ui_animation/videoAnimationTile.dart';

class MyNotifier extends StatefulWidget {
  @override
  _MyNotifierState createState() => _MyNotifierState();
}

class _MyNotifierState extends State<MyNotifier> {
  final List<String> urls = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ScrollProvider>(
          builder: (context, myScrollProvider, child) {
        return InViewNotifierList(
          scrollDirection: Axis.vertical,
          initialInViewIds: [urls[0]],
          isInViewPortCondition:
              (double deltaTop, double deltaBottom, double viewPortDimension) {
            return deltaTop < (0.35 * viewPortDimension) &&
                deltaBottom > (0.35 * viewPortDimension);
          },
          itemCount: urls.length,
          addAutomaticKeepAlives: true,
          physics: myScrollProvider.scrollable
              ? PageScrollPhysics()
              : NeverScrollableScrollPhysics(),
          onListEndReached: (){},
          builder: (BuildContext context, int index) {
            return VideoAnimationTile(
              url: urls[index],
            );
          },
        );
      }),
    );
  }
}

