import 'package:dnd_app/design_system/app_design/base_widgets/dnd_card.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/create_char/class/class.dart';
import 'class_item.dart';

class SelectClass extends StatelessWidget {
  const SelectClass({Key? key, this.classList}) : super(key: key);

  final Class? classList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          var item = classList!.results?[index];
          return DndCard(child: ClassItem(classDetail: item));
        },
        itemCount: classList?.results?.length ?? 0);
  }
}
