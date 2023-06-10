import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/domain/models/create_char/race/race.dart';
import 'package:dnd_app/util/monster_extension.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';

class SelectRaceItem extends StatelessWidget {
  const SelectRaceItem({Key? key, this.race}) : super(key: key);

  final RaceList? race;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.radiusDefault))),
      child: Stack(children: [
        _raceImage(),
        _raceName(),
      ]),
    );
  }

  Widget _raceImage() {
    return Align(
        alignment: Alignment.center,
        child: Image.asset(race!.index.toString().getRaceImage()));
  }

  Widget _raceName() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DndDefaultText(
          text: race?.name ?? '', fontSize: AppDimensions.textSizeHuge),
    );
  }
}
