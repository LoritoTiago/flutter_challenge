import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/presentation/text_base.dart';
import 'package:flutter_challenge/features/audio_players/presentation/view/audio_play.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({Key? key}) : super(key: key);

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final play = AudioPlayer();

  @override
  void initState() {
    super.initState();

    setAudio();
    play.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;
    });

    play.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    play.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    play.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextBase(
          text: "Musica home",
          font: FontWeight.w800,
          cor: Color.fromRGBO(255, 255, 255, 1),
          size: 30,
        ),
        const SizedBox(height: 5),
        const TextBase(
          text: "Unknow",
          font: FontWeight.w300,
          cor: Color.fromRGBO(255, 255, 255, 1),
          size: 20,
        ),
        const SizedBox(height: 10),
        Slider(
          min: 0.0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (v) async {
            final positionAudio = Duration(seconds: v.toInt());
            await play.seek(positionAudio);
            await play.resume();
          },
        ),
        const SizedBox(height: 10),
        _rowWidget(),
      ],
    );
  }

  Widget _rowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextBase(
          text: timer(position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
        FloatingActionButton(
          onPressed: () async {
            if (isPlaying) {
              isPlaying = false;
              await play.pause();
            } else {
              isPlaying = true;
              await play.resume();
            }
          },
          child: Icon(
            isPlaying ? Icons.stop : Icons.play_arrow,
            size: 30.0,
          ),
        ),
        TextBase(
          text: timer(duration - position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
      ],
    );
  }

  String timer(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minut = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minut,
      seconds,
    ].join(":");
  }

  Future setAudio() async {
    play.setReleaseMode(ReleaseMode.loop);
    final path = AudioCache(prefix: "assets/");
    final url = await path.load("pablo.mp3");
    play.setSourceAsset("pablo.mp3");
  }
}
