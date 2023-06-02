import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeState _homeState = const HomeState();

  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>(_onLoad);
    on<HomeBestiaryClickedEvent>(_navigateToBestiaryPage);
    on<HomeCreateCharClickedEvent>(_navigateToCreateCharPage);
  }

  void _onLoad(HomeEvent event, Emitter<HomeState> emitter) async {
    _homeState = _homeState.copyWith(homeStatus: HomeStatus.initial);
    emitter(_homeState);
  }

  void _navigateToCreateCharPage(
      HomeCreateCharClickedEvent event, Emitter<HomeState> emitter) {
    _homeState = _homeState.copyWith(homeStatus: HomeStatus.createCharClicked);
    emitter(_homeState);
  }

  void _navigateToBestiaryPage(
      HomeBestiaryClickedEvent event, Emitter<HomeState> emitter) {
    _homeState = _homeState.copyWith(homeStatus: HomeStatus.bestiaryClicked);
    emitter(_homeState);
  }
}
