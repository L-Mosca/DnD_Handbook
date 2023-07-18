abstract class MonsterEvent {}

class MonsterInitEvent extends MonsterEvent {
  final String monsterIndex;

  MonsterInitEvent({required this.monsterIndex});
}
