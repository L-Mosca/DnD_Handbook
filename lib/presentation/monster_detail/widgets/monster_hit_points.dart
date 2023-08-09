import 'package:dnd_app/domain/models/monster/monster_details.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';
import '../../../values/app_strings.dart';

class MonsterHitPoints extends StatelessWidget {
  const MonsterHitPoints({super.key, this.monsterDetail});

  final MonsterDetail? monsterDetail;

  @override
  Widget build(BuildContext context) {
    final hitPoints = monsterDetail?.hitPoints;
    final hitRoll = monsterDetail?.hitPointsRoll;
    if (hitPoints != null) {
      return Row(children: [
        const DndDefaultText(
          text: AppStrings.hitPoints,
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w800,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(width: 5),
        DndDefaultText(
          text: hitPoints.toString(),
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        if (hitRoll != null && hitRoll.isNotEmpty) const SizedBox(width: 5),
        if (hitRoll != null && hitRoll.isNotEmpty)
          DndDefaultText(
            text: '($hitRoll)',
            fontSize: AppDimensions.textSizeBig,
            fontWeight: FontWeight.w500,
            fontColorLight: AppColors.monsterDetailFontLight,
            fontColorDark: AppColors.monsterDetailFontDark,
          )
      ]);
    } else {
      return const SizedBox();
    }
  }
}
