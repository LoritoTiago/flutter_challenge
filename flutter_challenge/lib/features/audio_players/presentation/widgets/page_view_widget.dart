import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_challenge/core/injections/get_it.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_bloc.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_event.dart';

class PageViewWidget extends StatelessWidget {
  final List<String> data;
  const PageViewWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentindex = getIt<AudioPlayBloc>().getIndex;

    return PageView.builder(
      itemCount: data.length,
      controller: PageController(viewportFraction: .9),
      onPageChanged: (int v) {
        getIt<AudioPlayBloc>().add(
          AudioPlayChangingEvent(currentPosition: v),
        );
      },
      itemBuilder: (context, index) {
        final isCurrentItem = currentindex == index;

        final tween = isCurrentItem ? 1.0 : 0.8;
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
              key: UniqueKey(),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(data[index]).image,
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
