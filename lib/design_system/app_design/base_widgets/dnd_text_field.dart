import 'package:dnd_app/design_system/theme_data/dark_theme_provider.dart';
import 'package:dnd_app/values/app_colors.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DndTextField extends StatefulWidget {
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? fontColorDark;
  final Color? fontColorLight;
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
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool? enabled;

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
      required this.onEditingComplete,
      this.onChanged,
      this.focusNode,
      this.enabled,
      this.fontColorDark,
      this.fontColorLight,
      this.fontWeight,
      this.fontStyle,
      this.fontSize})
      : super(key: key);

  @override
  State<DndTextField> createState() => _DndTextFieldState();
}

class _DndTextFieldState extends State<DndTextField> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();

      final darkTheme = themeState.darkTheme;

      final shadowColor =
          darkTheme ? AppColors.shadowColorDark : AppColors.shadowColorLight;

      final fontColor = darkTheme
          ? widget.fontColorDark ?? AppColors.defaultTextDark
          : widget.fontColorLight ?? AppColors.defaultTextLight;

      final hintColor = darkTheme
          ? widget.hintTextColorDark ?? AppColors.defaultHintTextDark
          : widget.hintTextColorLight ?? AppColors.defaultHintTextLight;

      final focusedBorderColor = darkTheme
          ? widget.focusedBorderColorDark ?? AppColors.defaultBorderDark
          : widget.focusedBorderColorLight ?? AppColors.defaultBorderLight;

      final enabledColor = darkTheme
          ? widget.enabledBorderColorDark ?? AppColors.defaultBorderDark
          : widget.enabledBorderColorLight ?? AppColors.defaultBorderLight;

      final borderColor = darkTheme
          ? widget.borderColorDark ?? AppColors.defaultBorderDark
          : widget.borderColorLight ?? AppColors.defaultBorderLight;

      final fillColor = darkTheme
          ? widget.fillColorDark ?? AppColors.defaultFillColorDark
          : widget.fillColorLight ?? AppColors.defaultFillColorLight;

      final iconColor = darkTheme
          ? widget.iconColorDark ?? AppColors.iconColorDark
          : widget.iconColorLight ?? AppColors.iconColorLight;

      return Container(
        margin: EdgeInsets.only(
            left: widget.marginLeft ?? 0.0,
            top: widget.marginTop ?? 0.0,
            right: widget.marginRight ?? 0.0,
            bottom: widget.marginBottom ?? 0.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]),
        child: TextField(
          style: TextStyle(
              color: fontColor,
              fontWeight: widget.fontWeight ?? FontWeight.w400,
              fontSize: widget.fontSize ?? AppDimensions.textSizeDefault,
              fontStyle: widget.fontStyle ?? FontStyle.normal),
          enabled: widget.enabled ?? true,
          focusNode: widget.focusNode,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          controller: widget.controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: AppStrings.bestiarySearchHint,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: widget.hintTextSize ?? AppDimensions.textSizeBig,
              fontWeight: widget.hintTextWeight ?? FontWeight.w400,
              fontStyle: widget.hintFontStyle ?? FontStyle.normal,
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
      borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppDimensions.radiusDefault),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
