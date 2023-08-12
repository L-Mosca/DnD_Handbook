import 'package:dnd_app/domain/models/monster/monster.dart';

import '../../../base/state/base_state.dart';

enum BestiaryStatus { loading, initial, empty, error, success, filter }

class BestiaryState implements Copyable<BestiaryState> {
  const BestiaryState(
      {this.status = BestiaryStatus.initial, this.monster, this.filterList});

  final BestiaryStatus status;
  final Monster? monster;
  final List<Results>? filterList;

  @override
  BestiaryState copy() {
    return BestiaryState(
        status: status, monster: monster, filterList: filterList);
  }

  @override
  BestiaryState copyWith(
      {BestiaryStatus? bestiaryStatus,
      Monster? monster,
      List<Results>? cFilterList}) {
    return BestiaryState(
        status: bestiaryStatus ?? status,
        monster: monster ?? this.monster,
        filterList: cFilterList ?? filterList);
  }
}
