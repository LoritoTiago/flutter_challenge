import 'package:equatable/equatable.dart';

abstract class SondPlayState extends Equatable {
  const SondPlayState();
}

class SondPlayInicialState extends SondPlayState {
  final int index;
  const SondPlayInicialState({required this.index});
  @override
  List<Object?> get props => [index];
}

class SondPlayUpdateState extends SondPlayState {
  final int index;

  const SondPlayUpdateState({required this.index});
  @override
  List<Object?> get props => [index];
}

class SondPlayUpdateInicitialState extends SondPlayState {
  final int index;

  const SondPlayUpdateInicitialState({required this.index});
  @override
  List<Object?> get props => [index];
}

class SondPlayChangingSondState extends SondPlayState {
  final int index;
  const SondPlayChangingSondState({required this.index});
  @override
  List<Object?> get props => [index];
}

class SondPlayPauseState extends SondPlayState {
  final int index;
  const SondPlayPauseState({required this.index});
  @override
  List<Object?> get props => [index];
}

class SondPlayPlayingState extends SondPlayState {
  final int index;
  const SondPlayPlayingState({required this.index});
  @override
  List<Object?> get props => [index];
}
