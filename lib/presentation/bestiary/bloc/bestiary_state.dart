import 'package:dnd_app/domain/models/monster/monster.dart';

import '../../../base/state/base_state.dart';

enum BestiaryStatus { loading, initial, empty, error, success, filter }

class BestiaryState implements Copyable<BestiaryState> {
  const BestiaryState(
      {this.status = BestiaryStatus.initial, this.monster});

  final BestiaryStatus status;
  final Monster? monster;

  @override
  BestiaryState copy() {
    return BestiaryState(status: status, monster: monster);
  }

  @override
  BestiaryState copyWith({BestiaryStatus? bestiaryStatus, Monster? monster}) {
    return BestiaryState(
        status: bestiaryStatus ?? status, monster: monster);
  }
}
