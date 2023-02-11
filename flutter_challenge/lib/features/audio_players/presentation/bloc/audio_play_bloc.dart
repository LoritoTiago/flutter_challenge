import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_event.dart';
import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_state.dart';

class AudioPlayBloc extends Bloc<AudioPlayEvent, AudioPlayState> {
  int _index = 0;
  AudioPlayBloc() : super(const AudioPlayInicialState(index: 0)) {
    on<AudioPlayChangingEvent>((event, emit) {
      log("message ${event.currentPosition}");
      _index = event.currentPosition;
      emit(
        AudioPlayChangingAudioState(index: event.currentPosition),
      );
    });
  }

  int get getIndex => _index;
}
