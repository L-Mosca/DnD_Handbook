import 'package:dnd_app/base/state/base_state.dart';
import 'package:dnd_app/domain/models/create_char/race/race.dart';
import 'package:flutter/cupertino.dart';

enum CreateCharStatus { initial, selectRace, addContainer, raceClicked }

class CreateCharState implements Copyable<CreateCharState> {
  const CreateCharState(
      {this.status = CreateCharStatus.initial,
      this.race,
      this.widgetList = const [],
      this.raceSelected});

  final CreateCharStatus status;
  final Race? race;
  final List<Widget> widgetList;
  final RaceList? raceSelected;

  @override
  CreateCharState copy() {
    return CreateCharState(
        status: status,
        race: race,
        widgetList: widgetList,
        raceSelected: raceSelected);
  }

  @override
  CreateCharState copyWith(
      {CreateCharStatus? createCharStatus,
      Race? createCharRace,
      List<Widget>? pageViewWidgets,
      RaceList? createCharRaceSelected}) {
    return CreateCharState(
        status: createCharStatus ?? status,
        race: createCharRace ?? race,
        widgetList: pageViewWidgets ?? widgetList,
        raceSelected: createCharRaceSelected ?? raceSelected);
  }
}
