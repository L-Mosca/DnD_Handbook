import 'package:dnd_app/presentation/home/bloc/home_bloc.dart';
import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import '../presentation/home/home_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: RoutesConstants.routeHome,
        page: () => BlocProvider(
              create: (_) => HomeBloc()
                ..add(
                  HomeInitEvent(),
                ),
              child: const HomePage(),
            ),
        binding: HomeBinding(),
        transitionDuration: const Duration(milliseconds: 300),
        transition: transition.Transition.native)
  ];
}
