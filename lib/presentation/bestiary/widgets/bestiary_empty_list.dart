import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/flavor/build_flavor.dart';
import 'package:dnd_app/values/app_dimensions.dart';
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppDimensions.marginHuge),
        Image.asset('lib/assets/images/img_empty_list.png'),
        DndDefaultText(text: BuildFlavor.title),
      ],
    );
  }
}
