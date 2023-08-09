import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';

class MonsterSize extends StatelessWidget {
  const MonsterSize({super.key, this.size, this.alignment});

  final String? size;
  final String? alignment;

  @override
  Widget build(BuildContext context) {
    if ((size != null && size?.isNotEmpty == true) ||
        (alignment != null && alignment?.isNotEmpty == true)) {
      return DndDefaultText(
        text: '$size, $alignment',
        fontSize: AppDimensions.textSizeBig,
        fontColorDark: Colors.black,
        fontColorLight: Colors.black,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );
    } else {
      return const SizedBox();
    }
  }
}
