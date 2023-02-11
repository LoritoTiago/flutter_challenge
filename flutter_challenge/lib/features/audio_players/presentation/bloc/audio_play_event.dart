import 'package:equatable/equatable.dart';

abstract class AudioPlayEvent extends Equatable {}

class AudioPlayChangingEvent extends AudioPlayEvent {
  final int currentPosition;
  AudioPlayChangingEvent({required this.currentPosition});
  @override
  List<Object?> get props => [currentPosition];
}
