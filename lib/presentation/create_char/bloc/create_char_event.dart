import '../../../domain/models/create_char/race/race.dart';

abstract class CreateCharEvent {}

class CreateCharInitEvent extends CreateCharEvent {}

class SelectRaceEvent extends CreateCharEvent {}

class AddContainerEvent extends CreateCharEvent {}

class RaceClickedEvent extends CreateCharEvent {
  final RaceList? race;

  RaceClickedEvent({this.race});
}
