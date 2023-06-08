import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/util/monster_extension.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/models/create_char/race/race_detail.dart';

class RaceDetailContent extends StatelessWidget {
  const RaceDetailContent({Key? key, required this.raceDetail})
      : super(key: key);

  final RaceDetail raceDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _raceTitle(raceDetail.name ?? ''),
          _raceSpeed(raceDetail.speed.toString()),
          raceDetail.abilityBonuses?.isEmpty == true ||
                  raceDetail.abilityBonuses == null
              ? _raceBonus(raceDetail.abilityBonuses!)
              : const SizedBox(),
          _raceAlignment(raceDetail.alignment.toString()),
          _raceAge(raceDetail.age.toString()),
          _raceSize(raceDetail.size.toString()),
          _raceSizeDescription(raceDetail.sizeDescription.toString()),
          raceDetail.startingProficiencies?.isEmpty == true ||
                  raceDetail.startingProficiencies == null
              ? const SizedBox()
              : _raceProficiencies(raceDetail.startingProficiencies!),
          raceDetail.languages?.isEmpty == true || raceDetail.languages == null
              ? const SizedBox()
              : _raceLanguages(raceDetail.languages!),
          _raceLanguageDescription(raceDetail.languageDesc ?? ''),
          raceDetail.traits?.isEmpty == true || raceDetail.traits == null
              ? const SizedBox()
              : _raceTraits(raceDetail.traits!),
          raceDetail.subRaces?.isEmpty == true || raceDetail.subRaces == null
              ? const SizedBox()
              : _subRaces(raceDetail.subRaces!),
          Image.asset(
            raceDetail.index!.getRaceImage(),
            height: 300,
          )
        ],
      ),
    );
  }
}

Widget _raceTitle(String name) {
  return DndDefaultText(text: name);
}

Widget _raceSpeed(String speed) {
  return DndDefaultText(text: speed);
}

Widget _raceBonus(List<AbilityBonuses> bonus) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bonus.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var raceBonus = bonus[index];
        return Column(
          children: [
            DndDefaultText(text: raceBonus.bonus.toString()),
            DndDefaultText(text: raceBonus.abilityScore?.name ?? ''),
            const SizedBox(height: AppDimensions.marginDefault)
          ],
        );
      });
}

Widget _raceAlignment(String alignment) {
  return DndDefaultText(text: 'Alignment: $alignment');
}

Widget _raceAge(String age) {
  return DndDefaultText(text: 'Age: $age');
}

Widget _raceSize(String size) {
  return DndDefaultText(text: 'size: $size');
}

Widget _raceSizeDescription(String sizeDescription) {
  return DndDefaultText(text: 'Size Description: $sizeDescription');
}

Widget _raceProficiencies(List<StartingProficiencies> proficiencies) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var item = proficiencies[index];
      return Column(
        children: [
          DndDefaultText(text: item.name ?? ''),
          const SizedBox(height: AppDimensions.marginSmall)
        ],
      );
    },
    itemCount: proficiencies.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
  );
}

Widget _raceLanguages(List<Languages> languages) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var item = languages[index];
      return DndDefaultText(text: item.name ?? '');
    },
    itemCount: languages.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
  );
}

Widget _raceLanguageDescription(String languageDescription) {
  return DndDefaultText(text: languageDescription);
}

Widget _raceTraits(List<Traits> traits) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var item = traits[index];
      return DndDefaultText(text: item.name ?? '');
    },
    itemCount: traits.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
  );
}

Widget _subRaces(List<SubRaces> subRaces) {
  return ListView.builder(
    itemBuilder: (context, index) {
      var item = subRaces[index];
      return DndDefaultText(text: item.name ?? '');
    },
    itemCount: subRaces.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
  );
}

/*

Traits
age
alignment
size
speed
languages
subRaces

*/
