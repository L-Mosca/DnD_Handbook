import 'package:dnd_app/presentation/bestiary/bestiary_page.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_bloc.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_bloc.dart';
import 'package:dnd_app/presentation/create_char/create_char_binding.dart';
import 'package:dnd_app/presentation/create_char/create_char_page.dart';
import 'package:dnd_app/presentation/home/bloc/home_bloc.dart';
import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/presentation/monster_detail/bloc/monster_bloc.dart';
import 'package:dnd_app/presentation/monster_detail/bloc/monster_event.dart';
import 'package:dnd_app/presentation/monster_detail/monster_page.dart';
import 'package:dnd_app/presentation/race_detail/bloc/race_detail_bloc.dart';
import 'package:dnd_app/presentation/race_detail/bloc/race_detail_event.dart';
import 'package:dnd_app/presentation/race_detail/race_detail_binding.dart';
import 'package:dnd_app/presentation/race_detail/race_detail_page.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import '../presentation/bestiary/bestiary_binding.dart';
import '../presentation/create_char/bloc/create_char_event.dart';
import '../presentation/home/home_page.dart';
import '../presentation/monster_detail/monster_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: RoutesConstants.routeHome,
        page: () => BlocProvider(
              create: (_) => HomeBloc(Get.find())..add(HomeInitEvent()),
              child: HomePage(),
            ),
        binding: HomeBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: transition.Transition.native),
    GetPage(
        name: RoutesConstants.routeBestiary,
        page: () => BlocProvider(
              create: (_) => BestiaryBloc(Get.find())..add(BestiaryInitEvent()),
              child: const BestiaryPage(),
            ),
        binding: BestiaryBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: transition.Transition.native),
    GetPage(
        name: RoutesConstants.routeCreateChar,
        page: () => BlocProvider(
              create: (_) =>
                  CreateCharBloc(Get.find())..add(CreateCharInitEvent()),
              child: const CreateCharPage(),
            ),
        binding: CreateCharBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: transition.Transition.native),
    GetPage(
        name: RoutesConstants.routeRaceDetail,
        page: () => BlocProvider(
            create: (_) {
              var index =
                  Get.arguments[RoutesConstants.argumentRaceDetailIndex];
              return RaceDetailBloc(Get.find())
                ..add(RaceDetailInitEvent(index: index));
            },
            child: const RaceDetailPage()),
        binding: RaceDetailBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: transition.Transition.native),
    GetPage(
        name: RoutesConstants.routeMonsterDetail,
        page: () => BlocProvider(
            create: (_) {
              var monsterIndex =
                  Get.arguments[RoutesConstants.argumentMonsterDetailIndex];
              return MonsterBloc(Get.find())
                ..add(MonsterInitEvent(monsterIndex: monsterIndex));
            },
            child: const MonsterPage()),
        binding: MonsterBinding(),
        transitionDuration: const Duration(milliseconds: 200),
        transition: transition.Transition.native)
  ];
}
