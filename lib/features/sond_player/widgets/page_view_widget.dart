import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/features/sond_player/bloc/sond_play_state.dart';

import '../../../core/injections/get_it.dart';
import '../bloc/sond_play_bloc.dart';
import '../bloc/sond_play_event.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<SondPlayBloc>();
    return BlocBuilder<SondPlayBloc, SondPlayState>(
      bloc: bloc,
      builder: (context, state) {
        return PageView.builder(
          itemCount: bloc.audios.length,
          controller: PageController(viewportFraction: .9),
          onPageChanged: (int v) {
            bloc.add(
              SondPlayChangingEvent(currentPosition: v),
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
                  key: ValueKey(bloc.currentItem!.title),
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset("assets/${bloc.currentItem!.imageUrl}")
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
      },
    );
  }
}
