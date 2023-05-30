import 'package:dnd_app/values/app_constants.dart';
import 'package:flutter/material.dart';

import '../values/app_colors.dart';

extension StringToColor on String {
  Color getAlignmentColor() {
    switch (this) {
      case AppConstants.lawfulGood:
        return AppColors.lawfulGood;
      case AppConstants.neutralGood:
        return AppColors.neutralGood;
      case AppConstants.chaoticGood:
        return AppColors.chaoticGood;
      case AppConstants.lawfulNeutral:
        return AppColors.lawfulNeutral;
      case AppConstants.trueNeutral:
        return AppColors.trueNeutral;
      case AppConstants.chaoticNeutral:
        return AppColors.chaoticNeutral;
      case AppConstants.lawfulEvil:
        return AppColors.lawfulEvil;
      case AppConstants.neutralEvil:
        return AppColors.neutralEvil;
      case AppConstants.chaoticEvil:
        return AppColors.chaoticEvil;
      default:
        return AppColors.trueNeutral;
    }
  }
}

extension StringToImage on String {
  Image getAlignmentIcon() {
    switch (this) {
      case AppConstants.lawfulGood:
        return Image.asset('lib/assets/images/ic_lawful_good.png');
      case AppConstants.neutralGood:
        return Image.asset('lib/assets/images/ic_neutral_good.png');
      case AppConstants.chaoticGood:
        return Image.asset('lib/assets/images/ic_chaotic_good.png');
      case AppConstants.lawfulNeutral:
        return Image.asset('lib/assets/images/ic_lawful_neutral.png');
      case AppConstants.trueNeutral:
        return Image.asset('lib/assets/images/ic_true_neutral.png');
      case AppConstants.chaoticNeutral:
        return Image.asset('lib/assets/images/ic_chaotic_neutral.png');
      case AppConstants.lawfulEvil:
        return Image.asset('lib/assets/images/ic_lawful_evil.png');
      case AppConstants.neutralEvil:
        return Image.asset('lib/assets/images/ic_neutral_evil.png');
      case AppConstants.chaoticEvil:
        return Image.asset('lib/assets/images/ic_chaotic_evil.png');
      default:
        return Image.asset('lib/assets/images/ic_true_neutral.png');
    }
  }
}

extension StringToIcon on String {
  Image getTypeIcon() {
    switch (this) {
      case AppConstants.aberration:
        return Image.asset('lib/assets/images/ic_type_aberration.png');
      case AppConstants.beast:
        return Image.asset('lib/assets/images/ic_type_beast.jpeg');
      case AppConstants.celestial:
        return Image.asset('lib/assets/images/ic_type_celestial.png');
      case AppConstants.construct:
        return Image.asset('lib/assets/images/ic_type_construct.png');
      case AppConstants.dragon:
        return Image.asset('lib/assets/images/ic_type_dragon.png');
      case AppConstants.elemental:
        return Image.asset('lib/assets/images/ic_type_elemental.png');
      case AppConstants.fey:
        return Image.asset('lib/assets/images/ic_type_fey.png');
      case AppConstants.fiend:
        return Image.asset('lib/assets/images/ic_type_fiend.png');
      case AppConstants.giant:
        return Image.asset('lib/assets/images/ic_type_giant.png');
      case AppConstants.humanoid:
        return Image.asset('lib/assets/images/ic_type_humanoid.png');
      case AppConstants.monstrosity:
        return Image.asset('lib/assets/images/ic_type_monstrosity.png');
      case AppConstants.ooze:
        return Image.asset('lib/assets/images/ic_type_ooze.png');
      case AppConstants.plant:
        return Image.asset('lib/assets/images/ic_type_plant.png');
      case AppConstants.undead:
        return Image.asset('lib/assets/images/ic_type_undead.png');
      default:
        return Image.asset('lib/assets/images/ic_type_aberration.png');
    }
  }
}