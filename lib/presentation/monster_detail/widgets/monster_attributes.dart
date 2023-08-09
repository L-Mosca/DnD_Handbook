import 'package:dnd_app/domain/models/monster/monster_details.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';

class MonsterAttributes extends StatelessWidget {
  const MonsterAttributes({super.key, this.monsterDetail});

  final MonsterDetail? monsterDetail;

  @override
  Widget build(BuildContext context) {
    final data = monsterDetail;
    if (data != null &&
        data.strength != null &&
        data.dexterity != null &&
        data.constitution != null &&
        data.intelligence != null &&
        data.wisdom != null &&
        data.charisma != null) {
      return Column(
        children: [
          const SizedBox(height: AppDimensions.marginMini),
          Container(width: double.infinity, height: 2, color: Colors.red),
          const SizedBox(height: AppDimensions.marginDefault),
          Row(children: [
            Expanded(child: _generateAttrField('STR', data.strength!)),
            Expanded(child: _generateAttrField('DEX', data.dexterity!)),
            Expanded(child: _generateAttrField('CON', data.constitution!)),
            Expanded(child: _generateAttrField('INT', data.intelligence!)),
            Expanded(child: _generateAttrField('WIS', data.wisdom!)),
            Expanded(child: _generateAttrField('CHA', data.charisma!)),
          ]),
          const SizedBox(height: AppDimensions.marginDefault)
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _generateAttrField(String attr, int value) {
    return Column(
      children: [
        DndDefaultText(
          text: attr,
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w900,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        ),
        const SizedBox(height: 5),
        DndDefaultText(
          text: value.toString(),
          fontSize: AppDimensions.textSizeBig,
          fontWeight: FontWeight.w500,
          fontColorLight: AppColors.monsterDetailFontLight,
          fontColorDark: AppColors.monsterDetailFontDark,
        )
      ],
    );
  }
}
