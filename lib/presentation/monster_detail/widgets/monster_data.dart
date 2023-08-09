import 'package:cached_network_image/cached_network_image.dart';
import 'package:dnd_app/flavor/build_flavor.dart';
import 'package:dnd_app/presentation/monster_detail/widgets/monster_name.dart';
import 'package:dnd_app/presentation/monster_detail/widgets/monster_resistances.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../domain/models/monster/monster_details.dart';
import 'MonsterSpeed.dart';
import 'monster_abilities.dart';
import 'monster_actions.dart';
import 'monster_armor_class.dart';
import 'monster_attributes.dart';
import 'monster_hit_points.dart';
import 'monster_size.dart';

class MonsterData extends StatelessWidget {
  const MonsterData({super.key, required this.monsterDetail});

  final MonsterDetail monsterDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: AppDimensions.marginDefault),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _monsterFirstData(),
            MonsterArmorClass(armorClass: monsterDetail.armorClass),
            MonsterHitPoints(monsterDetail: monsterDetail),
            MonsterSpeed(speed: monsterDetail.speed),
            _monsterImage(),
            MonsterAttributes(monsterDetail: monsterDetail),
            MonsterResistances(monsterDetail: monsterDetail),
            MonsterAbilities(specialAbilities: monsterDetail.specialAbilities),
            MonsterSpecialActions(actions: monsterDetail.actions)
          ],
        ),
      ),
    );
  }

  Widget _monsterFirstData() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: AppDimensions.marginDefault),
      MonsterName(monsterName: monsterDetail.name),
      MonsterSize(size: monsterDetail.size, alignment: monsterDetail.alignment),
      const SizedBox(height: AppDimensions.marginMini),
      Container(width: double.infinity, height: 2, color: Colors.red),
      const SizedBox(height: AppDimensions.marginMini)
    ]);
  }

  Widget _monsterImage() {
    if (monsterDetail.image != null &&
        monsterDetail.image?.contains('null') == false) {
      return Container(
        margin: const EdgeInsets.only(
            right: AppDimensions.marginMini,
            left: AppDimensions.marginMini,
            top: 6),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: '${BuildFlavor.baseUrl}${monsterDetail.image}',
            placeholder: (context, url) =>
                const SpinKitCircle(color: Colors.red, size: 40),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
