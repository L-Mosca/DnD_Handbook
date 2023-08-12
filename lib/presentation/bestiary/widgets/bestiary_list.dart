import 'package:dnd_app/domain/models/monster/monster.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_name_item.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestiaryList extends StatefulWidget {
  final List<Results> monsterList;

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
          var item = widget.monsterList[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.toNamed(RoutesConstants.routeMonsterDetail, arguments: {
                    RoutesConstants.argumentMonsterDetailIndex: item.index ?? ''
                  });
                },
                child: BestiaryNameItem(monsterName: item.name),
              ),
              const SizedBox(height: AppDimensions.marginDefault),
            ],
          );
        },
        itemCount: widget.monsterList.length,
      ),
    );
  }
}
