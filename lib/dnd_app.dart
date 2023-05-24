import 'package:dnd_app/design_system/theme_data/dark_theme_provider.dart';
import 'package:dnd_app/design_system/theme_data/styles.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/app_routes.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DnDApp extends StatelessWidget {
  const DnDApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = DarkThemeProvider.to.darkTheme;

    return GetMaterialApp(
      key: key,
      title: 'D&D',
      theme: Styles.themeData(darkTheme, context),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.routeHome,
      getPages: AppRoutes.routes,
      initialBinding: HomeBinding(),
      builder: (context, child) {
        return FutureBuilder<bool>(
          future: DarkThemeProvider.to.darkThemePrefs.getTheme(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final darkTheme = snapshot.data ?? false;
              DarkThemeProvider.to.setDarkTheme = darkTheme;

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Styles.themeData(darkTheme, context),
                home: child,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
