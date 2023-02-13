import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/injections/get_it.dart';
import '../../../core/services/bloc_services.dart';
import '../model/audio_model.dart';
import 'audio_play_event.dart';
import 'audio_play_state.dart';

class AudioPlayBloc extends Bloc<AudioPlayEvent, AudioPlayState> {
  AudioPlayBloc() : super(const AudioPlayInicialState(index: 0)) {
    on<AudioPlayChangingEvent>((event, emit) {
      _index = event.currentPosition;
      setAudio();
      getIt<BlocServices>().play.resume();
      emit(
        AudioPlayChangingAudioState(index: event.currentPosition),
      );
    });
    on<AudioPlayPauseEvent>((event, emit) {
      isPlaying = false;
      emit(AudioPlayPauseState(index: event.currentPosition));
    });

    on<AudioPlayPlayingEvent>((event, emit) {
      isPlaying = true;
      emit(
        AudioPlayPlayingState(index: event.currentPosition),
      );
    });
  }

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  AudioModel? currentAudio;

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
      getIt<AudioPlayBloc>().add(AudioPlayUpdateEvent(currentPosition: _index));
    });

    getIt<BlocServices>().play.onDurationChanged.listen((newDuration) {
      duration = newDuration;
      getIt<AudioPlayBloc>().add(AudioPlayUpdateEvent(currentPosition: _index));
    });

    getIt<BlocServices>().play.onPositionChanged.listen((newPosition) {
      position = newPosition;
      getIt<AudioPlayBloc>().add(AudioPlayUpdateEvent(currentPosition: _index));
    });
  }

  void setAudio() {
    getIt<BlocServices>().play.setReleaseMode(ReleaseMode.release);
    getIt<BlocServices>().play.setSourceAsset(audios[_index].audioUrl!);
  }

  bool isCurrentItem(int index) {
    return _index == index;
  }

  double getTween(int index) {
    return isCurrentItem(index) ? 1.0 : 0.8;
  }

  void playOrPauseClick() async {
    final bloc = getIt<AudioPlayBloc>();
    if (isPlaying) {
      isPlaying = false;
      await getIt<BlocServices>().play.pause();
      bloc.add(
        AudioPlayPauseEvent(currentPosition: getIndex),
      );
    } else {
      isPlaying = true;
      await getIt<BlocServices>().play.resume();
      bloc.add(
        AudioPlayPlayingEvent(currentPosition: getIndex),
      );
    }
  }
}
