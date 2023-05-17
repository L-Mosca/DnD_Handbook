import 'package:dnd_app/design_system/theme_data/styles.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/app_routes.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DnDApp extends GetMaterialApp {
  DnDApp({super.key, required BuildContext context})
      : super(
          title: 'D&D',
          theme: Styles.themeData(context),
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesConstants.routeHome,
          getPages: AppRoutes.routes,
          initialBinding: HomeBinding(),
        );
}
