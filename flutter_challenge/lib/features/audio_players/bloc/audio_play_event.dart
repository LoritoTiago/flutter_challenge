import 'package:equatable/equatable.dart';

abstract class AudioPlayEvent extends Equatable {
  const AudioPlayEvent();
}

class AudioPlayChangingEvent extends AudioPlayEvent {
  final int currentPosition;
  const AudioPlayChangingEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class AudioPlayPauseEvent extends AudioPlayEvent {
  final int currentPosition;
  const AudioPlayPauseEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class AudioPlayPlayingEvent extends AudioPlayEvent {
  final int currentPosition;
  const AudioPlayPlayingEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class AudioPlayUpdateEvent extends AudioPlayEvent {
  final int currentPosition;

  const AudioPlayUpdateEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}
