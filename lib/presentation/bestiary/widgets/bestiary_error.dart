import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class BestiaryError extends StatefulWidget {
  const BestiaryError({Key? key}) : super(key: key);

  @override
  State<BestiaryError> createState() => _BestiaryErrorState();
}

class _BestiaryErrorState extends State<BestiaryError> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppDimensions.marginLarge),
          const Icon(Icons.error_outline,
              size: 80, color: AppColors.errorColor),
          const SizedBox(height: AppDimensions.marginDefault),
          _errorMessage(),
        ],
      ),
    );
  }

  DndDefaultText _errorMessage() {
    return const DndDefaultText(
        text: AppStrings.bestiaryErrorMessage,
        textAlign: TextAlign.center,
        fontColorDark: AppColors.errorColor,
        fontColorLight: AppColors.errorColor);
  }
}
