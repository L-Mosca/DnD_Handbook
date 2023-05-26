import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../values/app_colors.dart';
import '../../theme_data/dark_theme_provider.dart';

class DndDefaultText extends StatelessWidget {
  const DndDefaultText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontStyle,
    this.fontWeight,
    this.textAlign,
    this.fontColorLight,
    this.fontColorDark,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? fontColorLight;
  final Color? fontColorDark;

  @override
  Widget build(BuildContext context) {
    final themeState = Get.find<DarkThemeProvider>();

    return Obx(() {
      final darkTheme = themeState.darkTheme;
      final fontColor = darkTheme
          ? fontColorDark ?? AppColors.defaultTextDark
          : fontColorLight ?? AppColors.defaultTextLight;

      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? AppDimensions.textSizeDefault,
          color: fontColor,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        textAlign: textAlign ?? TextAlign.start,
      );
    });
  }
}
