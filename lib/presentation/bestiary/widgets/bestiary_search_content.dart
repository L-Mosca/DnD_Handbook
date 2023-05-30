import 'package:dnd_app/design_system/app_design/base_widgets/dnd_text_field.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_bloc.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/monster/monster.dart';

class BestiarySearchContent extends StatefulWidget {
  final TextEditingController controller;
  final List<Results> monster;

  const BestiarySearchContent(
      {Key? key, required this.controller, required this.monster})
      : super(key: key);

  @override
  State<BestiarySearchContent> createState() => _BestiarySearchContentState();
}

class _BestiarySearchContentState extends State<BestiarySearchContent> {
  List<Results>? monsterFilter;

  @override
  void initState() {
    super.initState();
    monsterFilter = widget.monster;
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DndTextField(
              hintText: AppStrings.bestiarySearchHint,
              borderRadius: 0,
              onEditingComplete: () {
                _searchAction(widget.controller.text);
              },
              controller: widget.controller),
        )
      ],
    );
  }

  void _searchAction(String query) {
    final suggestion = widget.monster.where((element) {
      final contactName = element.name?.toLowerCase();
      final input = query.toLowerCase();

      return contactName?.contains(input) == true;
    }).toList();

    setState(() => monsterFilter = suggestion);

    context.read<BestiaryBloc>().add(BestiaryFilterEvent(monster: monsterFilter));
  }
}
