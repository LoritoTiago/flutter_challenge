import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injections/get_it.dart';
import '..//bloc/audio_play_state.dart';
import '../bloc/audio_play_bloc.dart';
import '../widgets/audio_widget.dart';
import '../widgets/image_background.dart';
import '../widgets/page_view_widget.dart';

class AudioPlayWidget extends StatelessWidget {
  AudioPlayWidget({Key? key}) : super(key: key);

  // List<String> data = [
  //   "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg",
  //   "https://cdn.dribbble.com/users/3281732/screenshots/9165292/media/ccbfbce040e1941972dbc6a378c35e98.jpg",
  //   "https://cdn.dribbble.com/users/3281732/screenshots/10789882/media/a2b6545f0310ef683389c8d3e6b28ef7.jpg"
  // ];

  final bloc = getIt<AudioPlayBloc>();

  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }

  Widget _scaffold(context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AudioPlayBloc, AudioPlayState>(
        bloc: bloc,
        builder: (context, state) {
          // final bloc = getIt<AudioPlayBloc>();
          if (state is AudioPlayInicialState) {
            getIt<AudioPlayBloc>().initialSetting();
          }
          // final currentindex = bloc.getIndex;

          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageBackground(
                  imageUrl: getIt<AudioPlayBloc>().currentAudio!.imageUrl!,
                ),
                FractionallySizedBox(
                  heightFactor: 0.55,
                  child: Column(
                    children: [
                      const Expanded(
                        child: PageViewWidget(),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        height: 200.0,
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: AudioWidget(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
