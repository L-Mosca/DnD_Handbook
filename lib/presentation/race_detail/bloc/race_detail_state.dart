import 'package:dnd_app/base/state/base_state.dart';
import 'package:dnd_app/domain/models/create_char/race/race_detail.dart';

enum RaceDetailStatus { initial, loading, error, success }

class RaceDetailState implements Copyable<RaceDetailState> {
  RaceDetailState(
      {this.index, this.status = RaceDetailStatus.initial, this.raceDetail});

  final RaceDetailStatus status;
  final String? index;
  final RaceDetail? raceDetail;

  @override
  RaceDetailState copy() {
    return RaceDetailState(
        index: index, status: status, raceDetail: raceDetail);
  }

  @override
  RaceDetailState copyWith(
      {RaceDetailStatus? raceDetailStatus,
      String? raceDetailIndex,
      RaceDetail? raceDetailResponse}) {
    return RaceDetailState(
        index: raceDetailIndex ?? index,
        status: raceDetailStatus ?? status,
        raceDetail: raceDetailResponse ?? raceDetail);
  }
}
