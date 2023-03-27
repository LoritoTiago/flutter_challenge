import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'awesome_app_bar_event.dart';
part 'awesome_app_bar_state.dart';

class AwesomeAppBarBloc extends Bloc<AwesomeAppBarEvent, AwesomeAppBarState> {
  AwesomeAppBarBloc() : super(AwesomeAppBarInitial()) {
    on<AwesomeAppBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
