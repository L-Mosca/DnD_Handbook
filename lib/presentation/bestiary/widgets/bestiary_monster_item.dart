import 'package:cached_network_image/cached_network_image.dart';
import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/values/app_colors.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../design_system/theme_data/dark_theme_provider.dart';

class BestiaryMonsterItem extends StatelessWidget {
  const BestiaryMonsterItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final themeState = Get.find<DarkThemeProvider>();
      final darkTheme = themeState.darkTheme;

      final shadowColor =
          darkTheme ? AppColors.shadowColorDark : AppColors.shadowColorLight;

      final containerColor =
          darkTheme ? AppColors.cardDark : AppColors.cardLight;

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusDefault),
            color: containerColor,
            boxShadow: [_boxShadow(shadowColor)]),
        margin:
            const EdgeInsets.symmetric(horizontal: AppDimensions.marginMini),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _monsterImage()),
            Expanded(flex: 3, child: _monsterDetails())
          ],
        ),
      );
    });
  }

  Widget _monsterImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(AppDimensions.radiusDefault),
        topLeft: Radius.circular(AppDimensions.radiusDefault),
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://www.dnd5eapi.co/api/images/monsters/adult-black-dragon.png',
        placeholder: (context, url) =>
            const SpinKitCircle(color: AppColors.errorColor, size: 40),
        errorWidget: (context, url, error) => const Icon(
          Icons.hide_image_outlined,
          color: AppColors.errorColor,
          size: 40,
        ),
      ),
    );
  }

  Widget _monsterDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _monsterName(),
        const SizedBox(height: AppDimensions.marginDefault),
        _monsterAlignment(),
        const SizedBox(height: 5),
        _monsterType(),
      ],
    );
  }

  DndDefaultText _monsterName() {
    return const DndDefaultText(
      text: 'Adult Black Dragon',
      fontSize: AppDimensions.textSizeLarge,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _monsterType() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Image.asset('lib/assets/images/ic_type_dragon.png', height: 25),
          const SizedBox(width: 5),
          const DndDefaultText(text: 'dragon'),
        ],
      ),
    );
  }

  Widget _monsterAlignment() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Image.asset('lib/assets/images/ic_chaotic_evil.png', height: 25),
          const SizedBox(width: 5),
          const DndDefaultText(text: 'chaotic evil'),
        ],
      ),
    );
  }

  BoxShadow _boxShadow(Color shadowColor) {
    return BoxShadow(
        color: shadowColor.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 3,
        offset: const Offset(3, 5));
  }
}
