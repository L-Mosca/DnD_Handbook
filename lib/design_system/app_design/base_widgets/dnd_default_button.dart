import 'package:dnd_app/values/app_colors.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme_data/dark_theme_provider.dart';

class DndDefaultButton extends StatelessWidget {
  const DndDefaultButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.textAlign,
      this.colorLight,
      this.colorDark,
      this.textLight,
      this.textDark,
      this.borderRadius,
      this.borderLight,
      this.borderDark,
      this.rightIcon,
      this.leftIcon,
      this.rightIconLight,
      this.rightIconDark,
      this.leftIconLight,
      this.leftIconDark,
      this.leftIconMarginRight,
      this.leftIconMarginLeft,
      this.rightIconMarginRight,
      this.rightIconMarginLeft})
      : super(key: key);

  final VoidCallback onPressed;
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final Color? colorLight;
  final Color? colorDark;
  final Color? textLight;
  final Color? textDark;
  final double? borderRadius;
  final Color? borderLight;
  final Color? borderDark;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final Color? rightIconLight;
  final Color? rightIconDark;
  final Color? leftIconLight;
  final Color? leftIconDark;
  final double? leftIconMarginRight;
  final double? leftIconMarginLeft;
  final double? rightIconMarginRight;
  final double? rightIconMarginLeft;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();
      final darkTheme = themeState.darkTheme;

      final buttonColor = darkTheme
          ? colorDark ?? AppColors.buttonDark
          : colorLight ?? AppColors.buttonLight;

      final textColor = darkTheme
          ? textLight ?? AppColors.buttonTextLight
          : textDark ?? AppColors.buttonTextDark;

      final borderColor = darkTheme
          ? borderDark ?? Colors.transparent
          : borderLight ?? Colors.transparent;

      final buttonText = Text(text ?? '',
          style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? AppDimensions.textSizeDefault,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontStyle: fontStyle ?? FontStyle.normal),
          textAlign: textAlign ?? TextAlign.center);

      return MaterialButton(
        onPressed: onPressed,
        color: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppDimensions.radiusDefault),
            side: BorderSide(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [buttonText],
        ),
      );
    });
  }
}
