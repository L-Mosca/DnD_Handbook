import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../design_system/theme_data/dark_theme_provider.dart';
import '../../../values/app_colors.dart';

class BestiaryNameItem extends StatelessWidget {
  const BestiaryNameItem({Key? key, this.monsterName}) : super(key: key);

  final String? monsterName;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();
      final darkTheme = themeState.darkTheme;

      final shadowColor =
          darkTheme ? AppColors.shadowColorDark : AppColors.shadowColorLight;

      final containerColor =
          darkTheme ? AppColors.cardDark : AppColors.cardLight;

      final iconColor = darkTheme ? AppColors.cardLight : AppColors.cardDark;

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin:
            const EdgeInsets.symmetric(horizontal: AppDimensions.marginDefault),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusDefault),
            boxShadow: [_boxShadow(shadowColor)],
            color: containerColor),
        child: Row(
          children: [_monsterName(), _arrowIcon(iconColor)],
        ),
      );
    });
  }

  Widget _monsterName() {
    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppDimensions.marginDefault,
              top: AppDimensions.marginDefault,
              bottom: AppDimensions.marginDefault),
          child: DndDefaultText(
            text: monsterName ?? '',
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.textSizeBig,
          ),
        ));
  }

  Widget _arrowIcon(Color iconColor) {
    return Expanded(
        flex: 1, child: Icon(Icons.arrow_forward_ios_sharp, color: iconColor));
  }

  BoxShadow _boxShadow(Color shadowColor) {
    return BoxShadow(
        color: shadowColor.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 3,
        offset: const Offset(3, 5));
  }
}
