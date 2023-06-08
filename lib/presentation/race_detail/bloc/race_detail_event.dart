abstract class RaceDetailEvent {}

class RaceDetailInitEvent extends RaceDetailEvent {
  final String index;

  RaceDetailInitEvent({required this.index});
}
