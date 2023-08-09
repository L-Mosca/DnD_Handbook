import 'package:dnd_app/values/app_colors.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../domain/models/monster/monster_details.dart';
import '../../../values/app_strings.dart';

class MonsterArmorClass extends StatelessWidget {
  const MonsterArmorClass({super.key, this.armorClass});

  final List<ArmorClass>? armorClass;

  @override
  Widget build(BuildContext context) {
    if (armorClass != null && armorClass?.isNotEmpty == true) {
      return Column(
        children: [
          Row(children: [
            const DndDefaultText(
              text: AppStrings.armorClass,
              fontSize: AppDimensions.textSizeBig,
              fontWeight: FontWeight.w800,
              fontColorLight: AppColors.monsterDetailFontLight,
              fontColorDark: AppColors.monsterDetailFontDark,
            ),
            const SizedBox(width: 5),
            Expanded(
                child: DndDefaultText(
              text: '${armorClass?.map((e) => e.value)}',
              fontSize: AppDimensions.textSizeBig,
              fontColorDark: AppColors.monsterDetailFontDark,
              fontColorLight: AppColors.monsterDetailFontLight,
              fontWeight: FontWeight.w500,
            ))
          ]),
          const SizedBox(height: 2)
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
