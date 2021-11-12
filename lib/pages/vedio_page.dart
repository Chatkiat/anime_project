import 'package:anime_project/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  static const routeName = '/video';

  Video() : super();

  final String title = "Video Trailer";

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  //
  late VideoPlayerController _controller;
  Future<void>? _initializeVideoPlayerFuture;

  String videoName = 'assets/video/01.mp4';

  @override
  void initState() {
    _controller = VideoPlayerController.asset(videoName);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as Anime;

    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trailer",style: GoogleFonts.fredokaOne(),),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
        Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}