import '../../../domain/models/create_char/race/race.dart';

abstract class CreateCharEvent {}

class CreateCharInitEvent extends CreateCharEvent {}

class SelectRaceEvent extends CreateCharEvent {}

class RaceClickedEvent extends CreateCharEvent {
  final RaceList? race;

  RaceClickedEvent({this.race});
}

class CreateCharNextStep extends CreateCharEvent {
  final double? pageIndex;

  CreateCharNextStep({this.pageIndex});
}

class CreateCharBackStep extends CreateCharEvent {
  final double? pageIndex;

  CreateCharBackStep({this.pageIndex});
}