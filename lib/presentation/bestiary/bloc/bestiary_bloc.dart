import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/monster/monster_repository.dart';

class BestiaryBloc extends Bloc<BestiaryEvent, BestiaryState> {
  final MonsterRepository _monsterRepository;
  BestiaryState _bestiaryState = BestiaryState();

  BestiaryBloc(this._monsterRepository) : super(BestiaryState()) {
    on<BestiaryInitEvent>(_onLoad);
    on<BestiaryReloadingEvent>(_onLoad);
  }

  void _onLoad(BestiaryEvent event, Emitter<BestiaryState> emitter) async {
    emitter(_bestiaryState);
  }
}
