import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/util/monster_extension.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/create_char/class/class.dart';

class ClassItem extends StatelessWidget {
  const ClassItem({Key? key, this.classDetail}) : super(key: key);

  final Results? classDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppDimensions.marginMini),
        _classImage(classDetail?.index ?? ''),
        const SizedBox(height: 5),
        _className(classDetail?.name ?? ''),
        const SizedBox(height: 5)
      ],
    );
  }

  Widget _classImage(String classIndex) {
    return Expanded(child: Image.asset('lib/assets/images/img_race_dwarf.png'));
    //return Image.asset(classIndex.getClassImage());
  }

  Widget _className(String className) {
    return DndDefaultText(
        text: className,
        fontSize: AppDimensions.textSizeLarge,
        fontWeight: FontWeight.w600);
  }
}
