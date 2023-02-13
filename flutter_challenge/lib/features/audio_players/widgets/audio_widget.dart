import 'package:flutter/material.dart';

import '../../../../core/presentation/text_base.dart';
import '../../../core/injections/get_it.dart';
import '../../../core/services/bloc_services.dart';
import '../../../core/util/format_data.dart';
import '../bloc/audio_play_bloc.dart';
import '../bloc/audio_play_event.dart';
import '../bloc/audio_play_state.dart';

class AudioWidget extends StatelessWidget {
  // final AudioPlayState state;
  AudioWidget({Key? key}) : super(key: key);
  final audioBloc = getIt<AudioPlayBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBase(
          text: audioBloc.currentItem!.title ?? "Unknow",
          font: FontWeight.w800,
          cor: const Color.fromRGBO(255, 255, 255, 1),
          size: 30,
        ),
        const SizedBox(height: 5),
        TextBase(
          text: audioBloc.currentItem!.author ?? "Unknow",
          font: FontWeight.w300,
          cor: const Color.fromRGBO(255, 255, 255, 1),
          size: 20,
        ),
        const SizedBox(height: 10),
        Slider(
          min: 0.0,
          max: audioBloc.duration.inSeconds.toDouble(),
          value: audioBloc.position.inSeconds.toDouble(),
          onChanged: (v) async {
            final positionAudio = Duration(seconds: v.toInt());
            await getIt<BlocServices>().play.seek(positionAudio);
            await getIt<BlocServices>().play.resume();
            audioBloc
                .add(AudioPlayUpdateEvent(currentPosition: audioBloc.getIndex));
          },
        ),
        const SizedBox(height: 10),
        _rowWidget(audioBloc),
      ],
    );
  }

  Widget _rowWidget(AudioPlayBloc audioBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextBase(
          text: FormatData.timer(audioBloc.position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
        FloatingActionButton(
          onPressed: () async {
            audioBloc.playOrPauseClick();
          },
          child: Icon(
            audioBloc.isPlaying ? Icons.stop : Icons.play_arrow,
            size: 30.0,
          ),
        ),
        TextBase(
          text: FormatData.timer(audioBloc.duration - audioBloc.position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
      ],
    );
  }
}
