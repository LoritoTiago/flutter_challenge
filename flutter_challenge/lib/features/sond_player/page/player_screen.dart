import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injections/get_it.dart';
import '../../../core/presentation/text_base.dart';
import '../../../core/util/format_data.dart';
import '../bloc/sond_play_bloc.dart';
import '../bloc/sond_play_state.dart';
import '../widgets/image_background.dart';
import '../widgets/page_view_widget.dart';

class PlayierScreen extends StatelessWidget {
  PlayierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }

  Widget _scaffold(context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<SondPlayBloc, SondPlayState>(
        bloc: getIt<SondPlayBloc>(),
        builder: (context, state) {
          if (state is SondPlayInicialState) {
            getIt<SondPlayBloc>().initialSetting();
          }
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageBackground(
                  imageUrl: getIt<SondPlayBloc>().currentItem!.imageUrl!,
                ),
                FractionallySizedBox(
                  heightFactor: .70,
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
                        child: _audioWidget(),
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

  Widget _audioWidget() {
    return Column(
      children: [
        TextBase(
          text: getIt<SondPlayBloc>().currentItem!.title ?? "Unknow",
          font: FontWeight.w800,
          cor: const Color.fromRGBO(255, 255, 255, 1),
          size: 30,
        ),
        const SizedBox(height: 5),
        TextBase(
          text: getIt<SondPlayBloc>().currentItem!.author ?? "Unknow",
          font: FontWeight.w300,
          cor: const Color.fromRGBO(255, 255, 255, 1),
          size: 20,
        ),
        const SizedBox(height: 10),
        Slider(
          min: 0.0,
          max: getIt<SondPlayBloc>().duration.inSeconds.toDouble(),
          value: getIt<SondPlayBloc>().position.inSeconds.toDouble(),
          onChanged: (v) async {
            getIt<SondPlayBloc>().sliderSond(v);
          },
        ),
        const SizedBox(height: 10),
        _rowWidget(getIt<SondPlayBloc>()),
      ],
    );
  }

  Widget _rowWidget(SondPlayBloc audioBloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextBase(
          text: FormatData.toTimer(audioBloc.position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
        FloatingActionButton(
          onPressed: () async {
            audioBloc.playOurPauseClick();
          },
          child: Icon(
            audioBloc.isPlaying ? Icons.stop : Icons.play_arrow,
            size: 30.0,
          ),
        ),
        TextBase(
          text: FormatData.toTimer(audioBloc.duration - audioBloc.position),
          cor: Colors.white,
          font: FontWeight.w200,
          size: 10.0,
        ),
      ],
    );
  }
}
