import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../design_system/theme_data/dark_theme_provider.dart';
import '../dnd_app.dart';
import 'build_flavor.dart';

void buildFlavor(Flavor flavor) {
  BuildFlavor.appFlavor = flavor;
  Get.put(DarkThemeProvider());
  runApp(Builder(builder: (context) => DnDApp()));
}
