import 'package:dnd_app/domain/repositories/firebase/analytics/firebase_analytics_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAnalyticsRepository>(
        () => FirebaseAnalyticsRepository());
  }
}
