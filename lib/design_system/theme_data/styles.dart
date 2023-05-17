import 'package:flutter/material.dart';

class Styles {

  static ThemeData themeData(BuildContext context) {
    final isDarkTheme = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? const Color(0xFF000000)
                  : const Color(0xFFFFFFFF),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor:
            isDarkTheme ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
        canvasColor: isDarkTheme ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme: isDarkTheme
                  ? const ColorScheme.dark()
                  : const ColorScheme.light(),
            ));
  }
}
