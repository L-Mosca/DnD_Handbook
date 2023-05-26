import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/flavor/build_flavor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../design_system/theme_data/dark_theme_provider.dart';

class BestiaryEmptyList extends StatefulWidget {
  const BestiaryEmptyList({Key? key}) : super(key: key);

  @override
  State<BestiaryEmptyList> createState() => _BestiaryEmptyListState();
}

class _BestiaryEmptyListState extends State<BestiaryEmptyList> {
  @override
  Widget build(BuildContext context) {
    final themeState = Get.find<DarkThemeProvider>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/img_empty_list.png'),
          DndDefaultText(text: BuildFlavor.title),
          Obx(
            () => SwitchListTile(
              secondary: Icon(
                themeState.darkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
              value: themeState.darkTheme,
              onChanged: (bool value) {
                themeState.setDarkTheme = value;
                Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          Container(child: DndDefaultText(text: "test"))
        ],
      ),
    );
  }
}
