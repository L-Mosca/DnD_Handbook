import 'package:dnd_app/domain/models/monster/monster_details.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';
import '../../../values/app_strings.dart';

class MonsterSpeed extends StatelessWidget {
  const MonsterSpeed({super.key, this.speed});

  final Speed? speed;

  @override
  Widget build(BuildContext context) {
    if (speed != null &&
        speed?.walk != null &&
        speed?.walk?.isNotEmpty == true) {
      return Column(
        children: [
          const SizedBox(height: 2),
          Row(
            children: [
              const DndDefaultText(
                text: AppStrings.speed,
                fontSize: AppDimensions.textSizeBig,
                fontWeight: FontWeight.w900,
                fontColorLight: AppColors.monsterDetailFontLight,
                fontColorDark: AppColors.monsterDetailFontDark,
              ),
              const SizedBox(width: 5),
              DndDefaultText(
                text: speed?.walk ?? '',
                fontSize: AppDimensions.textSizeBig,
                fontWeight: FontWeight.w500,
                fontColorLight: AppColors.monsterDetailFontLight,
                fontColorDark: AppColors.monsterDetailFontDark,
              )
            ],
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
