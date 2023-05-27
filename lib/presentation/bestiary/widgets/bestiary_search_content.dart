import 'package:dnd_app/design_system/app_design/base_widgets/dnd_text_field.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/cupertino.dart';

class BestiarySearchContent extends StatefulWidget {
  final TextEditingController controller;

  const BestiarySearchContent({Key? key, required this.controller})
      : super(key: key);

  @override
  State<BestiarySearchContent> createState() => _BestiarySearchContentState();
}

class _BestiarySearchContentState extends State<BestiarySearchContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DndTextField(
              hintText: AppStrings.bestiarySearchHint,
              borderRadius: 0,
              onEditingComplete: () {},
              controller: widget.controller),
        )
      ],
    );
  }
}
