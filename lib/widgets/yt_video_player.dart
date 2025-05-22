import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YTVideoPlayer extends StatefulWidget {
  final String youtubeUrl;

  const YTVideoPlayer({super.key, required this.youtubeUrl});

  @override
  State<YTVideoPlayer> createState() => _YTVideoPlayerState();
}

class _YTVideoPlayerState extends State<YTVideoPlayer> {
  late final YoutubePlayerController _controller;
  late final String _videoId;

  String getYouTubeId(String url) {
    final regExp = RegExp(
      r'^.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/|shorts\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
    );
    final match = regExp.firstMatch(url);
    return (match != null && match.group(1)!.length == 11)
        ? match.group(1)!
        : url;
  }

  @override
  void initState() {
    super.initState();
    _videoId = getYouTubeId(widget.youtubeUrl);
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
        strictRelatedVideos: true,
        enableJavaScript: true,
        playsInline: false,
      ),
    )..loadVideo(_videoId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.3,
      height: size.width * 0.3 * 9 / 16, // 16:9 aspect ratio
      child: YoutubePlayerControllerProvider(
          controller: _controller,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          )),
    );
  }
}
