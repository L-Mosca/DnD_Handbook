import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../domain/models/monster/monster_details.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';
import '../../../values/app_strings.dart';

class MonsterResistances extends StatelessWidget {
  const MonsterResistances({super.key, this.monsterDetail});

  final MonsterDetail? monsterDetail;

  @override
  Widget build(BuildContext context) {
    final data = monsterDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: double.infinity, height: 2, color: Colors.red),
        const SizedBox(height: AppDimensions.marginMini),
        if (data?.damageResistances != null &&
            data?.damageResistances?.isNotEmpty == true)
          _damageResistances(data?.damageResistances),
        if (data?.damageImmunities != null &&
            data?.damageImmunities?.isNotEmpty == true)
          _damageImmunities(data?.damageImmunities),
        if (data?.conditionImmunities != null &&
            data?.conditionImmunities?.isNotEmpty == true)
          _conditionImmunities(data?.conditionImmunities),
        if (data?.senses != null) _senses(data?.senses),
        if (data?.languages != null && data?.languages?.isNotEmpty == true)
          _languages(data?.languages),
        if (data?.challengeRating != null)
          _challenge(data?.challengeRating, data?.xp),
        const SizedBox(height: AppDimensions.marginMini),
        Container(width: double.infinity, height: 2, color: Colors.red)
      ],
    );
  }

  Widget _damageResistances(List<String>? damageResistances) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.marginMini),
        const DndDefaultText(
          text: AppStrings.damageResistances,
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        DndDefaultText(
          text: damageResistances!.join(', '),
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _damageImmunities(List<String>? damageImmunities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DndDefaultText(
          text: AppStrings.damageImmunities,
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        DndDefaultText(
          text: damageImmunities!.join(', '),
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _conditionImmunities(List<ConditionImmunities>? conditionImmunities) {
    if (conditionImmunities != null && conditionImmunities.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DndDefaultText(
              text: AppStrings.conditionImmunities,
              fontSize: AppDimensions.textSizeBig,
              fontWeight: FontWeight.w900,
              fontColorLight: AppColors.monsterDetailFontLight,
              fontColorDark: AppColors.monsterDetailFontDark),
          DndDefaultText(
            text: conditionImmunities.map((e) => e.name).join(', '),
            fontSize: AppDimensions.textSizeBig,
            fontWeight: FontWeight.w500,
            fontColorLight: AppColors.monsterDetailFontLight,
            fontColorDark: AppColors.monsterDetailFontDark,
          ),
          const SizedBox(height: 5),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _senses(Senses? senses) {
    final darkVision =
        (senses?.darkvision != null && senses?.darkvision?.isNotEmpty == true)
            ? '${senses!.darkvision!}, '
            : '';
    final passivePerception = senses?.passivePerception ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DndDefaultText(
          text: '${AppStrings.senses} - ',
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        DndDefaultText(
          text: '$darkVision$passivePerception',
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _languages(String? languages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DndDefaultText(
          text: AppStrings.languages,
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        DndDefaultText(
          text: languages ?? '',
          fontWeight: FontWeight.w500,
          fontSize: AppDimensions.textSizeBig,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _challenge(num? challenge, int? xp) {
    final monsterChallenge = (challenge != null) ? '$challenge ' : '';
    final monsterXp = (xp != null) ? '($xp XP)' : '';
    return Row(
      children: [
        const DndDefaultText(
          text: '${AppStrings.challenge} - ',
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        Expanded(
            child: DndDefaultText(
          text: '$monsterChallenge $monsterXp',
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        )),
        const SizedBox(height: 5),
      ],
    );
  }
}
