import 'package:dnd_app/domain/repositories/monster/monster_repository.dart';
import 'package:dnd_app/presentation/monster_detail/bloc/monster_event.dart';
import 'package:dnd_app/presentation/monster_detail/bloc/monster_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonsterBloc extends Bloc<MonsterEvent, MonsterState> {
  final MonsterRepository _monsterRepository;
  MonsterState _monsterState = MonsterState();

  MonsterBloc(this._monsterRepository) : super(MonsterState()) {
    on<MonsterInitEvent>(_onInitEvent);
  }

  void _onInitEvent(
      MonsterInitEvent event, Emitter<MonsterState> emitter) async {
    _monsterState =
        _monsterState.copyWith(monsterStatus: MonsterStatus.loading);
    emitter(_monsterState);

    await Future.delayed(const Duration(seconds: 1));

    try {
      final monsterDetail =
          await _monsterRepository.fetchMonsterDetail(event.monsterIndex);

      if (monsterDetail == null) {
        _monsterState =
            _monsterState.copyWith(monsterStatus: MonsterStatus.error);
        emitter(_monsterState);
      } else {
        _monsterState = _monsterState.copyWith(
            monsterStatus: MonsterStatus.success,
            cMonsterDetail: monsterDetail);
        emitter(_monsterState);
      }
    } catch (e) {
      _monsterState =
          _monsterState.copyWith(monsterStatus: MonsterStatus.error);
      emitter(_monsterState);
    }
  }
}
