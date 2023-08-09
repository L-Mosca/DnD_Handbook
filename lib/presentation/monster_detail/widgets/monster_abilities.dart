import 'package:flutter/material.dart';

import '../../../domain/models/monster/monster_details.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';

class MonsterAbilities extends StatelessWidget {
  const MonsterAbilities({super.key, this.specialAbilities});

  final List<SpecialAbilities>? specialAbilities;

  @override
  Widget build(BuildContext context) {
    final abilities = specialAbilities;
    if (abilities != null && abilities.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: AppDimensions.marginDefault),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: abilities.length,
            itemBuilder: (context, index) {
              final data = abilities[index];
              final name = (data.name != null && data.name?.isNotEmpty == true)
                  ? '${data.name}.'
                  : '';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                        TextSpan(
                          text: name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: AppDimensions.textSizeBig,
                              color: AppColors.monsterDetailFontLight),
                        ),
                        if (data.desc != null && data.desc?.isNotEmpty == true)
                          TextSpan(
                              text: data.desc,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppDimensions.textSizeBig,
                                  color: AppColors.monsterDetailFontLight))
                      ])),
                  const SizedBox(height: AppDimensions.marginDefault)
                ],
              );
            }),
      );
    } else {
      return const SizedBox();
    }
  }
}
