import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? AppColors.scaffoldBackgroundDark : AppColors.scaffoldBackgroundLight,
        primaryColor: isDarkTheme ? Colors.red : Colors.greenAccent,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? const Color(0xFF000000)
                  : const Color(0xFFFFFFFF),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor:
            isDarkTheme ? AppColors.cardDark : AppColors.cardLight,
        canvasColor: isDarkTheme ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme: isDarkTheme
                  ? const ColorScheme.dark()
                  : const ColorScheme.light(),
            ));
  }
}
