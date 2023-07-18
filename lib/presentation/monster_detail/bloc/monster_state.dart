import 'package:dnd_app/base/state/base_state.dart';

enum MonsterStatus { loading, error, success }

class MonsterState implements Copyable<MonsterState> {
  MonsterState({this.status = MonsterStatus.loading, this.monsterIndex});

  final MonsterStatus? status;
  final String? monsterIndex;

  @override
  MonsterState copy() {
    return MonsterState(status: status, monsterIndex: monsterIndex);
  }

  @override
  MonsterState copyWith({MonsterStatus? monsterStatus, String? index}) {
    return MonsterState(
        status: monsterStatus ?? status, monsterIndex: monsterIndex ?? index);
  }
}
