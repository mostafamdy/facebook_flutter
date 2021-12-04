import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoDriver extends StatefulWidget {
  String url;
  VideoDriver({required this.url});
  @override
  _VideoDriverState createState() => _VideoDriverState();
}

class _VideoDriverState extends State<VideoDriver> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isPlay=true;
  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return Container(
              color: Colors.black26,
              child: Stack(
                children: [
                  isPlay?VideoPlayer(_controller..play()):VideoPlayer(_controller..pause()),
                  GestureDetector(onTap:(){
                    print("isPLay $isPlay");
                    isPlay?_controller.pause():_controller.play();
                    setState(() {
                      isPlay=!isPlay;
                    });
                  }),
                  if(!isPlay) Center(child: Icon(Icons.play_arrow,size: 35,))
                ],
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
