import 'package:dnd_app/domain/service/theme_prefs/dark_theme_prefs.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    darkThemePrefs.setAppTheme(isDarkMode.value);
  }

  @override
  void onInit() async {
    isDarkMode.value = await darkThemePrefs.getTheme();
    super.onInit();
  }
}
