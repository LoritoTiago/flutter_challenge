import 'package:equatable/equatable.dart';

abstract class SondPlayEvent extends Equatable {
  const SondPlayEvent();
}

class SondPlayChangingEvent extends SondPlayEvent {
  final int currentPosition;
  const SondPlayChangingEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class SondPlayPauseEvent extends SondPlayEvent {
  final int currentPosition;
  const SondPlayPauseEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class SondPlayPlayingEvent extends SondPlayEvent {
  final int currentPosition;
  const SondPlayPlayingEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class SondPlayUpdateEvent extends SondPlayEvent {
  final int currentPosition;

  const SondPlayUpdateEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}

class SondPlayUpdateInitialEvent extends SondPlayEvent {
  final int currentPosition;

  const SondPlayUpdateInitialEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}
