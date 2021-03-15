import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:reels_ui_animation/userProfileImageLikeCommentShare.dart';
import 'package:reels_ui_animation/videoPlayerWithControls.dart';
import 'allComments.dart';

class VideoAnimationTile extends StatefulWidget {
  final String url;
  VideoAnimationTile({@required this.url});
  @override
  _VideoAnimationTileState createState() => _VideoAnimationTileState();
}

class _VideoAnimationTileState extends State<VideoAnimationTile>
    with SingleTickerProviderStateMixin {
  BetterPlayerController _betterPlayerController;
  AnimationController _controller;
  double iconsHeightAndWidth;
  bool mute = true;
  @override
  void initState() {
    /*Animation Controller To Control Video ViewPort Size*/
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      fit: BoxFit.fill,
      aspectRatio: (9 / 16),
      //Turned visibility off of icons by setting value to false.
      controlsConfiguration:
          BetterPlayerControlsConfiguration(showControls: false),
    );
    //  Setting Up Data Source
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.url,
      cacheConfiguration: BetterPlayerCacheConfiguration(
        useCache: true,
      ),
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Calculating working Area.
    double fullVideoViewPortHeight = MediaQuery.of(context).size.height -
        kBottomNavigationBarHeight -
        ScreenUtil().statusBarHeight;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: fullVideoViewPortHeight,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AllComments(
              fullVideoViewPortHeight: fullVideoViewPortHeight,
              controller: _controller),
          //Video Section
          AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget child) {
              //Calculating icons Height And Width For Responsiveness.
              iconsHeightAndWidth = (fullVideoViewPortHeight * 1) * 0.05 -
                  (((fullVideoViewPortHeight * 1) * 0.05) / 2) *
                      _controller.value;
              return FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  height: fullVideoViewPortHeight -
                      fullVideoViewPortHeight * 0.6 * _controller.value,
                  child: InViewNotifierWidget(
                    id: widget.url,
                    builder:
                        (BuildContext context, bool isInView, Widget child) {
                      if (isInView) {
                        _betterPlayerController.play();
                        _betterPlayerController.setLooping(true);
                      } else {
                        _betterPlayerController.pause();
                      }
                      return AspectRatio(
                        aspectRatio: (9 / 16),
                        child: Stack(
                          children: [
                            /*Volume 1 equal to 100% */
                            VideoPlayerWithControls(betterPlayerController: _betterPlayerController),
                            UserProfileImageLikeCommentShare(
                                iconsHeightAndWidth: iconsHeightAndWidth,
                                controller: _controller)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


