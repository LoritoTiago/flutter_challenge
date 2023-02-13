import 'package:equatable/equatable.dart';

abstract class AudioPlayState extends Equatable {
  const AudioPlayState();
}

class AudioPlayInicialState extends AudioPlayState {
  final int index;
  const AudioPlayInicialState({required this.index});
  @override
  List<Object?> get props => [index];
}

class AudioPlayUpdateState extends AudioPlayState {
  final int index;
  const AudioPlayUpdateState({required this.index});
  @override
  List<Object?> get props => [index];
}

class AudioPlayChangingAudioState extends AudioPlayState {
  final int index;
  const AudioPlayChangingAudioState({required this.index});
  @override
  List<Object?> get props => [index];
}

class AudioPlayPauseState extends AudioPlayState {
  final int index;
  const AudioPlayPauseState({required this.index});
  @override
  List<Object?> get props => [index];
}

class AudioPlayPlayingState extends AudioPlayState {
  final int index;
  const AudioPlayPlayingState({required this.index});
  @override
  List<Object?> get props => [index];
}
