import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:reels_ui_animation/userProfileImageAndName.dart';

import 'likeCommentShare.dart';
import 'likesAndComments.dart';

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
  double iconsHeight;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      fit: BoxFit.fill,
      aspectRatio: (9 / 16),
      controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false, enableMute: true),
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
          AnimatedBuilder(
              animation: _controller,
              builder: (_, Widget child) {
                iconsHeight = (fullVideoViewPortHeight * 1) * 0.05 -
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
                          _betterPlayerController.setVolume(0);
                        } else {
                          _betterPlayerController.pause();
                        }
                        return AspectRatio(
                          aspectRatio: (9 / 16),
                          child: Stack(
                            children: [
                              BetterPlayer(controller: _betterPlayerController),
                              Padding(
                                padding: EdgeInsets.all(iconsHeight*0.5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    UserProfileImageAndName(
                                        iconsHeight: iconsHeight),
                                    SizedBox(
                                      height: iconsHeight * 0.2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        LikeCommentShare(
                                            iconsHeight: iconsHeight*0.5,
                                            controller: _controller),
                                        LikesAndComments(
                                            iconsHeight: iconsHeight*0.5)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
