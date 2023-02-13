import 'package:flutter_challenge/core/services/bloc_services.dart';
import 'package:flutter_challenge/features/audio_players/bloc/audio_play_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void initilizeGetIt() {
  getIt.registerLazySingleton(() => AudioPlayBloc());
  getIt.registerSingleton(BlocServices());
}
