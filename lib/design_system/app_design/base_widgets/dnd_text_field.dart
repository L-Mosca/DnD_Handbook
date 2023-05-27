import 'package:dnd_app/design_system/theme_data/dark_theme_provider.dart';
import 'package:dnd_app/values/app_colors.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DndTextField extends StatelessWidget {
  final String? hintText;
  final Color? hintTextColorLight;
  final Color? hintTextColorDark;
  final double? hintTextSize;
  final FontWeight? hintTextWeight;
  final FontStyle? hintFontStyle;
  final double? borderRadius;
  final bool? filed;
  final Color? fillColorLight;
  final Color? fillColorDark;
  final Color? focusedBorderColorLight;
  final Color? focusedBorderColorDark;
  final Color? enabledBorderColorLight;
  final Color? enabledBorderColorDark;
  final Color? borderColorLight;
  final Color? borderColorDark;
  final TextInputAction? textInputAction;
  final Icon? prefixIcon;
  final Color? iconColorLight;
  final Color? iconColorDark;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;

  const DndTextField(
      {Key? key,
      this.hintText,
      this.hintTextColorLight,
      this.hintTextColorDark,
      this.hintTextSize,
      this.hintTextWeight,
      this.hintFontStyle,
      this.borderRadius,
      this.filed,
      this.fillColorLight,
      this.fillColorDark,
      this.focusedBorderColorLight,
      this.focusedBorderColorDark,
      this.enabledBorderColorLight,
      this.enabledBorderColorDark,
      this.borderColorLight,
      this.borderColorDark,
      this.textInputAction,
      this.prefixIcon,
      this.marginTop,
      this.marginBottom,
      this.marginLeft,
      this.marginRight,
      this.iconColorLight,
      this.iconColorDark,
      required this.controller,
      required this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();

      final darkTheme = themeState.darkTheme;

      final shadowColor =
          darkTheme ? AppColors.shadowColorDark : AppColors.shadowColorLight;

      final hintColor = darkTheme
          ? hintTextColorDark ?? AppColors.defaultHintTextDark
          : hintTextColorLight ?? AppColors.defaultHintTextLight;

      final focusedBorderColor = darkTheme
          ? focusedBorderColorDark ?? AppColors.defaultBorderDark
          : focusedBorderColorLight ?? AppColors.defaultBorderLight;

      final enabledColor = darkTheme
          ? enabledBorderColorDark ?? AppColors.defaultBorderDark
          : enabledBorderColorLight ?? AppColors.defaultBorderLight;

      final borderColor = darkTheme
          ? borderColorDark ?? AppColors.defaultBorderDark
          : borderColorLight ?? AppColors.defaultBorderLight;

      final fillColor = darkTheme
          ? fillColorDark ?? AppColors.defaultFillColorDark
          : fillColorLight ?? AppColors.defaultFillColorLight;

      final iconColor = darkTheme
          ? iconColorDark ?? AppColors.iconColorDark
          : iconColorLight ?? AppColors.iconColorLight;

      return Container(
        margin: EdgeInsets.only(
            left: marginLeft ?? 0.0,
            top: marginTop ?? 0.0,
            right: marginRight ?? 0.0,
            bottom: marginBottom ?? 0.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]),
        child: TextField(
          onEditingComplete: onEditingComplete,
          controller: controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: AppStrings.bestiarySearchHint,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintTextSize ?? AppDimensions.textSizeDefault,
              fontWeight: hintTextWeight ?? FontWeight.w400,
              fontStyle: hintFontStyle ?? FontStyle.normal,
            ),
            focusedBorder: _defaultBorderStyle(focusedBorderColor),
            enabledBorder: _defaultBorderStyle(enabledColor),
            border: _defaultBorderStyle(borderColor),
            filled: true,
            fillColor: fillColor,
            prefixIcon: Icon(Icons.search, color: iconColor),
          ),
        ),
      );
    });
  }

  OutlineInputBorder _defaultBorderStyle(Color borderColor) {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(borderRadius ?? AppDimensions.radiusDefault),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
