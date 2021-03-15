import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:reels_ui_animation/userProfileImageLikeCommentShare.dart';

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
          //Comments Section. Replace Content of Container according to your needs.
          Positioned(
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
          ),
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
                            GestureDetector(
                              child: BetterPlayer(
                                  controller: _betterPlayerController),
                              onTap: () {
                                if (mute == true) {
                                  _betterPlayerController.setVolume(1);
                                  mute = false;
                                } else {
                                  _betterPlayerController.setVolume(0);
                                  mute = true;
                                }
                              },
                              onDoubleTap: () {
                                if (_betterPlayerController.isPlaying()) {
                                  _betterPlayerController.pause();
                                } else {
                                  _betterPlayerController.play();
                                }
                              },
                            ),
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
