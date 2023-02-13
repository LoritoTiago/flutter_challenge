import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/features/sond_players/model/audio_model.dart';

import '../../../core/injections/get_it.dart';
import '../../../core/services/bloc_services.dart';

import 'sond_play_event.dart';
import 'sond_play_state.dart';

class SondPlayBloc extends Bloc<SondPlayEvent, SondPlayState> {
  SondPlayBloc() : super(const SondPlayInicialState(index: 0)) {
    on<SondPlayUpdateEvent>((event, emit) {
      emit(SondPlayUpdateState(index: event.currentPosition));
      getIt<SondPlayBloc>()
          .add(SondPlayUpdateInitialEvent(currentPosition: _index));
    });
    on<SondPlayUpdateInitialEvent>((event, emit) {
      emit(SondPlayUpdateInicitialState(index: event.currentPosition));
    });

    on<SondPlayChangingEvent>((event, emit) {
      _index = event.currentPosition;
      setSond();
      getIt<BlocServices>().play.resume();
      emit(SondPlayChangingSondState(index: event.currentPosition));
    });
    on<SondPlayPauseEvent>((event, emit) {
      isPlaying = false;
      emit(SondPlayPauseState(index: event.currentPosition));
    });

    on<SondPlayPlayingEvent>((event, emit) {
      isPlaying = true;

      emit(SondPlayPlayingState(index: event.currentPosition));
    });
  }

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  AudioModel? currentSond;

  List<AudioModel> audios = [
    AudioModel(
      author: "Pheelz",
      title: "Stand by you",
      audioUrl: "stand.mp3",
      imageUrl: "stand.png",
    ),
    AudioModel(
      author: "Asake",
      title: "Yoga",
      audioUrl: "yoga.mp3",
      imageUrl: "yoga.jpeg",
    ),
  ];
  int _index = 0;

  int get getIndex => _index;

  AudioModel? get currentItem => audios[_index];

  void initialSetting() {
    getIt<BlocServices>().play.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;

      getIt<SondPlayBloc>().add(SondPlayUpdateEvent(currentPosition: _index));
    });

    getIt<BlocServices>().play.onDurationChanged.listen((newDuration) {
      duration = newDuration;

      getIt<SondPlayBloc>().add(SondPlayUpdateEvent(currentPosition: _index));
    });

    getIt<BlocServices>().play.onPositionChanged.listen((newPosition) {
      position = newPosition;

      getIt<SondPlayBloc>().add(SondPlayUpdateEvent(currentPosition: _index));
    });
    setSond();
  }

  void setSond() {
    getIt<BlocServices>().play.setReleaseMode(ReleaseMode.release);
    getIt<BlocServices>().play.setSourceAsset(audios[_index].audioUrl!);
  }

  bool isCurrentItem(int index) {
    return _index == index;
  }

  double getTween(int index) {
    return isCurrentItem(index) ? 1.0 : 0.6;
  }

  void playOurPauseClick() async {
    final bloc = getIt<SondPlayBloc>();
    if (isPlaying) {
      isPlaying = false;
      await getIt<BlocServices>().play.pause();
      bloc.add(
        SondPlayPauseEvent(currentPosition: getIndex),
      );
    } else {
      isPlaying = true;
      await getIt<BlocServices>().play.resume();
      bloc.add(
        SondPlayPlayingEvent(currentPosition: getIndex),
      );
    }
  }

  void sliderSond(double v) async {
    final positionAudio = Duration(seconds: v.toInt());
    await getIt<BlocServices>().play.seek(positionAudio);
    if (isPlaying) await getIt<BlocServices>().play.resume();

    getIt<SondPlayBloc>().add(
        SondPlayUpdateEvent(currentPosition: getIt<SondPlayBloc>().getIndex));
  }
}
