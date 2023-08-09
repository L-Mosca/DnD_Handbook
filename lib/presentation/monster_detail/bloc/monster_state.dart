import 'package:dnd_app/base/state/base_state.dart';

import '../../../domain/models/monster/monster_details.dart';

enum MonsterStatus { loading, error, success }

class MonsterState implements Copyable<MonsterState> {
  MonsterState(
      {this.status = MonsterStatus.loading,
      this.monsterIndex,
      this.monsterDetail});

  final MonsterStatus? status;
  final String? monsterIndex;
  final MonsterDetail? monsterDetail;

  @override
  MonsterState copy() {
    return MonsterState(
        status: status,
        monsterIndex: monsterIndex,
        monsterDetail: monsterDetail);
  }

  @override
  MonsterState copyWith(
      {MonsterStatus? monsterStatus,
      String? index,
      MonsterDetail? cMonsterDetail}) {
    return MonsterState(
        status: monsterStatus ?? status,
        monsterIndex: monsterIndex ?? index,
        monsterDetail: cMonsterDetail ?? monsterDetail);
  }
}
