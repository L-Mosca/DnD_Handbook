import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../values/app_colors.dart';
import '../../theme_data/dark_theme_provider.dart';

class DndShimmer extends StatelessWidget {
  const DndShimmer(
      {Key? key,
      this.baseColorLight,
      this.baseColorDark,
      this.highlightColorLight,
      this.highlightColorDark,
      required this.child})
      : super(key: key);

  final Color? baseColorLight;
  final Color? baseColorDark;
  final Color? highlightColorLight;
  final Color? highlightColorDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();
      final darkTheme = themeState.darkTheme;

      final baseColor = darkTheme
          ? baseColorDark ?? AppColors.shimmerBaseDark
          : baseColorLight ?? AppColors.shimmerBaseLight;

      final highlightColor = darkTheme
          ? highlightColorDark ?? AppColors.shimmerHighlightDark
          : highlightColorLight ?? AppColors.shimmerHighlightLight;

      return Shimmer.fromColors(
          baseColor: baseColor, highlightColor: highlightColor, child: child);
    });
  }
}
