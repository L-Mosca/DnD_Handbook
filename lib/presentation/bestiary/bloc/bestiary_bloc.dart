import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/monster/monster_repository.dart';

class BestiaryBloc extends Bloc<BestiaryEvent, BestiaryState> {
  final MonsterRepository _monsterRepository;
  BestiaryState _bestiaryState = const BestiaryState();

  BestiaryBloc(this._monsterRepository) : super(const BestiaryState()) {
    on<BestiaryInitEvent>(_onLoad);
    on<BestiaryReloadingEvent>(_onLoad);
    on<BestiaryFilterEvent>(_onFilter);
  }

  void _onLoad(BestiaryEvent event, Emitter<BestiaryState> emitter) async {
    _bestiaryState =
        _bestiaryState.copyWith(bestiaryStatus: BestiaryStatus.loading);
    emitter(_bestiaryState);

    var monster = await _monsterRepository.fetchMonsters();

    if (monster != null) {
      _bestiaryState = _bestiaryState.copyWith(
          bestiaryStatus: BestiaryStatus.success, monster: monster);
      emitter(_bestiaryState);
    } else {
      _bestiaryState = _bestiaryState.copyWith(
          bestiaryStatus: BestiaryStatus.error, monster: monster);
      emitter(_bestiaryState);
    }
  }

  void _onFilter(
      BestiaryFilterEvent event, Emitter<BestiaryState> emitter) async {
    final query = event.query;
    final list = _bestiaryState.monster?.results;

    if (list != null && list.isNotEmpty) {
      if (query.isNotEmpty) {
        final suggestion = list.where((element) {
          final monsters = element.name?.toLowerCase();
          final input = query.toLowerCase();
          return monsters?.contains(input) == true;
        }).toList();

        _bestiaryState = _bestiaryState.copyWith(
            bestiaryStatus: BestiaryStatus.filter, cFilterList: suggestion);
        emitter(_bestiaryState);
      } else {
        _bestiaryState = _bestiaryState.copyWith(
            bestiaryStatus: BestiaryStatus.filter,
            cFilterList: _bestiaryState.monster?.results);
        emitter(_bestiaryState);
      }
    }
  }
}
