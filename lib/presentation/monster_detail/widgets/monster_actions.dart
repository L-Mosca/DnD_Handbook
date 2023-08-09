import 'package:flutter/material.dart';

import '../../../design_system/app_design/base_widgets/dnd_default_text.dart';
import '../../../domain/models/monster/monster_details.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_dimensions.dart';
import '../../../values/app_strings.dart';

class MonsterSpecialActions extends StatelessWidget {
  const MonsterSpecialActions({super.key, this.actions});

  final List<MonsterActions>? actions;

  @override
  Widget build(BuildContext context) {
    if (actions != null && actions?.isNotEmpty == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimensions.marginSmall),
          const DndDefaultText(
            text: AppStrings.actions,
            fontSize: AppDimensions.textSizeExtraBig,
            fontWeight: FontWeight.w900,
            fontColorLight: AppColors.monsterDetailFontLight,
            fontColorDark: AppColors.monsterDetailFontDark,
          ),
          Container(height: 1, width: double.infinity, color: Colors.red),
          const SizedBox(height: AppDimensions.marginMini),
          ListView.builder(
            itemBuilder: (context, index) {
              final data = actions?[index];
              final name =
                  (data?.name != null && data?.name?.isNotEmpty == true)
                      ? '${data!.name}. '
                      : '';
              final description =
                  (data?.desc != null && data?.desc?.isNotEmpty == true)
                      ? data!.desc
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
                                fontSize: AppDimensions.textSizeBig,
                                fontWeight: FontWeight.w900,
                                color: AppColors.monsterDetailFontLight)),
                        if (description?.isNotEmpty == true)
                          TextSpan(
                              text: description,
                              style: const TextStyle(
                                  fontSize: AppDimensions.textSizeBig,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.monsterDetailFontLight))
                      ])),
                  const SizedBox(height: AppDimensions.marginMini)
                ],
              );
            },
            itemCount: actions?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
