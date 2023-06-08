import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/domain/models/create_char/race/race.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';

class SelectRaceItem extends StatelessWidget {
  const SelectRaceItem({Key? key, this.race}) : super(key: key);

  final RaceList? race;

  @override
  Widget build(BuildContext context) {
    return DndDefaultText(
        text: race?.name ?? '', fontSize: AppDimensions.textSizeLarge);
  }
}
