import 'package:dnd_app/presentation/home/home_binding.dart';
import 'package:dnd_app/routes/app_routes.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:get/get.dart';

class DnDApp extends GetMaterialApp {
  DnDApp({super.key}) : super(
    title: 'D&D',
    debugShowCheckedModeBanner: false,
    initialRoute: RoutesConstants.routeHome,
    getPages: AppRoutes.routes,
    initialBinding: HomeBinding(),
  );
}