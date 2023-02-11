import 'package:flutter_challenge/features/audio_players/presentation/bloc/audio_play_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void initilizeGetIt() {
  getIt.registerLazySingleton(() => AudioPlayBloc());
}
