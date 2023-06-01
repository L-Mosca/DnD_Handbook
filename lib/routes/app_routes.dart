import 'package:dnd_app/presentation/bestiary/bestiary_page.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_bloc.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/presentation/home/bloc/home_bloc.dart';
import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import '../presentation/bestiary/bestiary_binding.dart';
import '../presentation/home/home_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: RoutesConstants.routeHome,
        page: () => BlocProvider(
              create: (_) => HomeBloc()..add(HomeInitEvent()),
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
        transition: transition.Transition.native)
  ];
}
