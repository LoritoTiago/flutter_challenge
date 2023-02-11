import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/core/injections/get_it.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_bloc.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_event.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_state.dart';
import 'package:flutter_challenge/features/audio_players/presentation/widgets/image_background.dart';
import 'package:flutter_challenge/features/audio_players/presentation/widgets/page_view_widget.dart';

class AudioPlay extends StatelessWidget {
  AudioPlay({Key? key}) : super(key: key);

  List<String> data = [
    "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg",
    "https://cdn.dribbble.com/users/3281732/screenshots/9165292/media/ccbfbce040e1941972dbc6a378c35e98.jpg",
    "https://cdn.dribbble.com/users/3281732/screenshots/10789882/media/a2b6545f0310ef683389c8d3e6b28ef7.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<AudioPlayBloc, AudioPlayState>(
        bloc: getIt<AudioPlayBloc>(),
        builder: (context, state) {
          final currentindex = getIt<AudioPlayBloc>().getIndex;

          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageBackground(
                  imageUrl: data[currentindex],
                ),
                FractionallySizedBox(
                  heightFactor: 0.55,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageViewWidget(data: data),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: size.width,
                        height: 100.0,
                        color: Colors.red,
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
