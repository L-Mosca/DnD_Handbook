import 'package:dnd_app/domain/models/monster/monster.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_name_item.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';

class BestiaryList extends StatefulWidget {
  final Monster monsterList;

  const BestiaryList({Key? key, required this.monsterList}) : super(key: key);

  @override
  State<BestiaryList> createState() => _BestiaryListState();
}

class _BestiaryListState extends State<BestiaryList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              //BestiaryItem(), -> layout com o card completo de monstro (objeto MonsterDetail)
              BestiaryNameItem(
                  monsterName: widget.monsterList.results?[index].name),
              const SizedBox(height: AppDimensions.marginDefault),
            ],
          );
        },
        itemCount: widget.monsterList.results?.length,
      ),
    );
  }
}
