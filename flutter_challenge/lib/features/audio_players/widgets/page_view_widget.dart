import 'package:flutter/material.dart';

import '../../../core/injections/get_it.dart';
import '../bloc/audio_play_bloc.dart';
import '../bloc/audio_play_event.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<AudioPlayBloc>();
    return PageView.builder(
      itemCount: bloc.audios.length,
      controller: PageController(viewportFraction: .9),
      onPageChanged: (int v) {
        bloc.add(
          AudioPlayChangingEvent(currentPosition: v),
        );
      },
      itemBuilder: (context, index) {
        final tween = bloc.getTween(index);
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 270),
          tween: Tween(begin: tween, end: tween),
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(bloc.currentAudio!.title),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      Image.asset("assets/img/${bloc.currentAudio!.imageUrl}")
                          .image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    // offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
