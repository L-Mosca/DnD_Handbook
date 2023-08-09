import 'package:dnd_app/values/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../values/app_dimensions.dart';

class MonsterName extends StatelessWidget {
  const MonsterName({super.key, this.monsterName});

  final String? monsterName;

  @override
  Widget build(BuildContext context) {
    if (monsterName != null && monsterName?.isNotEmpty == true) {
      return DndDefaultText(
          text: monsterName ?? '',
          fontColorDark: AppColors.monsterDetailFontDark,
          fontColorLight: AppColors.monsterDetailFontDark,
          fontSize: AppDimensions.textSizeHuge,
          fontWeight: FontWeight.w600);
    } else {
      return const SizedBox();
    }
  }
}
