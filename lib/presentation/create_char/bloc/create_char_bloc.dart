import 'package:dnd_app/domain/repositories/character/character_repository.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_event.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_state.dart';
import 'package:dnd_app/presentation/create_char/widgets/select_race/select_race.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCharBloc extends Bloc<CreateCharEvent, CreateCharState> {
  final CharacterRepository _characterRepository;
  CreateCharState _createCharState = const CreateCharState();

  CreateCharBloc(this._characterRepository) : super(const CreateCharState()) {
    on<CreateCharInitEvent>(_onLoad);
    on<SelectRaceEvent>(_fetchRace);
    on<AddContainerEvent>(_addContainer);
    on<RaceClickedEvent>(_onRaceSelected);
  }

  void _onLoad(
      CreateCharInitEvent event, Emitter<CreateCharState> emitter) async {
    _createCharState =
        _createCharState.copyWith(createCharStatus: CreateCharStatus.initial);
    emitter(_createCharState);

    var races = await _characterRepository.fetchRaces();
    List<Widget> widgetList = [SelectRace(race: races)];
    _createCharState = _createCharState.copyWith(
        createCharStatus: CreateCharStatus.selectRace,
        createCharRace: races,
        pageViewWidgets: widgetList);
    emitter(_createCharState);
  }

  void _fetchRace(
      SelectRaceEvent event, Emitter<CreateCharState> emitter) async {
    var races = await _characterRepository.fetchRaces();

    _createCharState = _createCharState.copyWith(
        createCharStatus: CreateCharStatus.selectRace, createCharRace: races);
    emitter(_createCharState);
  }

  void _addContainer(
      AddContainerEvent event, Emitter<CreateCharState> emitter) async {
    var newContainer = Container(width: 200, height: 200, color: Colors.blue);
    var actualList = state.widgetList;
    actualList.add(newContainer);

    _createCharState = _createCharState.copyWith(
        createCharStatus: CreateCharStatus.addContainer,
        pageViewWidgets: actualList);
    emitter(_createCharState);
  }

  void _onRaceSelected(
      RaceClickedEvent event, Emitter<CreateCharState> emitter) async {
    _createCharState = _createCharState.copyWith(
        createCharStatus: CreateCharStatus.raceClicked,
        createCharRaceSelected: event.race);
    emitter(_createCharState);
  }
}
