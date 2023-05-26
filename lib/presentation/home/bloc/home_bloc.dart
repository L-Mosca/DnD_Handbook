import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    on<HomeEvent>(_onLoad);
  }

  void _onLoad(HomeEvent event, Emitter<HomeState> emitter) async {

  }
}
