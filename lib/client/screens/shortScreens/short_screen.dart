import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sih1309/utils/Dimensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final List<String> videoIds = [
    'nGvmVpuV0uc', // Replace with your YouTube video IDs
    'P7IKEeK06RY',
    'Y3g_S4xu9yM',
  ];

  int currentVideoIndex = 0;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoIds[currentVideoIndex],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: false, // Hide controls initially
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void playNextVideo() {
    if (currentVideoIndex < videoIds.length - 1) {
      currentVideoIndex++;
    } else {
      currentVideoIndex = 0; // Loop back to the first video
    }
    _controller.load(videoIds[currentVideoIndex]);
  }

  void playPreviousVideo() {
    if (currentVideoIndex > 0) {
      currentVideoIndex--;
    } else {
      currentVideoIndex = videoIds.length - 1; // Go to the last video when at the first one
    }
    _controller.load(videoIds[currentVideoIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            context.go("/Learning");
          },
        ),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        title: const Text(
          "Shorts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          // Adjust this value to control the sensitivity of the swipe gesture
          if (details.delta.dy > 20) {
            // Swipe down
            playPreviousVideo();
          } else if (details.delta.dy < -20) {
            // Swipe up
            playNextVideo();
          }
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: (){
                Text("wait patiently");
              },
              onEnded: (_) {
                playNextVideo(); // Play the next video when the current video ends
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dimension.val35),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton.small(
                onPressed: () {
                  playPreviousVideo();
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Icon(
                  Icons.skip_previous,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.small(

              onPressed: () {
                playNextVideo();
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: Icon(
                Icons.skip_next,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
