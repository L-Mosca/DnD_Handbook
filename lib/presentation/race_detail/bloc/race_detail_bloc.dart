import 'package:dnd_app/domain/repositories/character/character_repository.dart';
import 'package:dnd_app/presentation/race_detail/bloc/race_detail_event.dart';
import 'package:dnd_app/presentation/race_detail/bloc/race_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaceDetailBloc extends Bloc<RaceDetailEvent, RaceDetailState> {
  final CharacterRepository _characterRepository;
  RaceDetailState _raceDetailState = RaceDetailState();

  RaceDetailBloc(this._characterRepository) : super(RaceDetailState()) {
    on<RaceDetailInitEvent>(_onLoad);
  }

  void _onLoad(
      RaceDetailInitEvent event, Emitter<RaceDetailState> emitter) async {
    _raceDetailState =
        _raceDetailState.copyWith(raceDetailStatus: RaceDetailStatus.loading);
    emitter(_raceDetailState);

    var raceDetail = await _characterRepository.fetchRaceDetail(event.index);

    if (raceDetail == null) {
      _raceDetailState =
          _raceDetailState.copyWith(raceDetailStatus: RaceDetailStatus.error);
    } else {
      _raceDetailState = _raceDetailState.copyWith(
          raceDetailStatus: RaceDetailStatus.success,
          raceDetailResponse: raceDetail);
    }

    emitter(_raceDetailState);
  }
}
