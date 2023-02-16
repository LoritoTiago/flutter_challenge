import 'package:flutter_challenge/core/services/bloc_services.dart';
import 'package:flutter_challenge/features/sond_player/bloc/sond_play_bloc.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void initilizeGetIt() {
  getIt.registerLazySingleton<SondPlayBloc>(() => SondPlayBloc());
  getIt.registerSingleton<BlocServices>(BlocServices());
}
