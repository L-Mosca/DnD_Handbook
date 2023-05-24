import 'package:dnd_app/domain/service/theme_prefs/dark_theme_prefs.dart';
import 'package:get/get.dart';

class DarkThemeProvider extends GetxController {
  final DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  RxBool _darkTheme = false.obs;

  static DarkThemeProvider get to => Get.find();

  bool get darkTheme => _darkTheme.value;

  set setDarkTheme(bool value) {
    _darkTheme.value = value;
    darkThemePrefs.setAppTheme(value);
    update();
  }
}
