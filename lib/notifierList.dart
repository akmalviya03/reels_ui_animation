import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:reels_ui_animation/videoAnimationTile.dart';
class MyNotifier extends StatelessWidget {
  final List<String> urls = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4',
    'https://vod-progressive.akamaized.net/exp=1616747998~acl=%2A%2F604924802.mp4%2A~hmac=cc855158915a78e8124c6e228aabb7e9ff29e714d651ef1c404037465e93e43e/vimeo-prod-skyfire-std-us/01/1757/7/183788693/604924802.mp4?filename=Microscope+-+5456.mp4'
    'https://vod-progressive.akamaized.net/exp=1616748106~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F433%2F18%2F452168431%2F1989876316.mp4~hmac=e6586603d14e7cd109060cf9c137b381d7590a49c55de4595b50489920df44c6/vimeo-prod-skyfire-std-us/01/433/18/452168431/1989876316.mp4?filename=Windmill+-+47905.mp4',
    'https://vod-progressive.akamaized.net/exp=1616748141~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2645%2F16%2F413229662%2F1776913803.mp4~hmac=417a40966da6249c8dd237d459b1010710a919dd3f56549db98e995b452404fc/vimeo-prod-skyfire-std-us/01/2645/16/413229662/1776913803.mp4?filename=Waterfall+-+37088.mp4'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InViewNotifierList(
        scrollDirection: Axis.vertical,
        initialInViewIds: [urls[0]],
        isInViewPortCondition:
            (double deltaTop, double deltaBottom, double viewPortDimension) {
          return deltaTop < (0.35 * viewPortDimension) &&
              deltaBottom > (0.35 * viewPortDimension);
        },
        itemCount: urls.length,
        addAutomaticKeepAlives: true,
        physics: PageScrollPhysics(),
        builder: (BuildContext context, int index) {
          return VideoAnimationTile(
            url: urls[index],
          );
        },
      ),
    );
  }
}
