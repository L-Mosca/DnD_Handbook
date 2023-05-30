import '../../../domain/models/monster/monster.dart';

abstract class BestiaryEvent {}

class BestiaryInitEvent  extends BestiaryEvent {}
class BestiaryReloadingEvent extends BestiaryEvent {}
class BestiaryFilterEvent extends BestiaryEvent {
  final List<Results>? monster;
  BestiaryFilterEvent({this.monster});
}