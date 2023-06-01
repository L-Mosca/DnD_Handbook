import 'package:dnd_app/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme_data/dark_theme_provider.dart';

class DndCard extends StatelessWidget {
  const DndCard(
      {Key? key,
      this.cardLightColor,
      this.cardDarkColor,
      this.elevation,
      required this.child,
      this.shadowLightColor,
      this.shadowDarkColor})
      : super(key: key);

  final Color? cardLightColor;
  final Color? cardDarkColor;
  final Color? shadowLightColor;
  final Color? shadowDarkColor;
  final double? elevation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();

      final darkTheme = themeState.darkTheme;
      final shadowColor = darkTheme
          ? shadowDarkColor ?? AppColors.cardLight.withOpacity(0.3)
          : shadowLightColor ?? AppColors.cardDark.withOpacity(0.8);
      final cardColor = darkTheme
          ? cardDarkColor ?? AppColors.cardDark
          : cardLightColor ?? AppColors.cardLight;

      return Card(
        elevation: elevation ?? 5,
        color: cardColor,
        shadowColor: shadowColor,
        child: child,
      );
    });
  }
}
