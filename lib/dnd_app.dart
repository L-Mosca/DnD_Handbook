import 'package:dnd_app/design_system/theme_data/dark_theme_provider.dart';
import 'package:dnd_app/design_system/theme_data/styles.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/app_routes.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:dnd_app/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

class DnDApp extends StatefulWidget {
  const DnDApp({Key? key}) : super(key: key);

  @override
  State<DnDApp> createState() => _DnDAppState();
}

class _DnDAppState extends State<DnDApp> {
  @override
  Widget build(BuildContext context) {
    final darkTheme = DarkThemeProvider.to.darkTheme;

    return GetMaterialApp(
      title: 'D&D',
      theme: Styles.themeData(darkTheme, context),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstants.routeHome,
      getPages: AppRoutes.routes,
      initialBinding: HomeBinding(),
      navigatorObservers: [Get.put<RouteObserver>(RouteObserver<PageRoute>())],
      builder: (context, child) {
        return FutureBuilder<bool>(
          future: DarkThemeProvider.to.darkThemePrefs.getTheme(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final darkTheme = snapshot.data ?? false;
              DarkThemeProvider.to.setDarkTheme = darkTheme;

              final color = darkTheme
                  ? AppColors.scaffoldBackgroundDark
                  : AppColors.scaffoldBackgroundLight;

              FlutterStatusbarcolor.setStatusBarColor(
                  AppColors.scaffoldBackgroundDark);

              return SafeArea(
                child: Scaffold(
                  backgroundColor: color,
                  body: child,
                ),
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
