

abstract class BestiaryEvent {}

class BestiaryInitEvent extends BestiaryEvent {}

class BestiaryReloadingEvent extends BestiaryEvent {}

class BestiaryFilterEvent extends BestiaryEvent {
  final String query;

  BestiaryFilterEvent({required this.query});
}
