import 'package:dnd_app/domain/repositories/monster/monster_repository.dart';
import 'package:get/get.dart';

class BestiaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonsterRepository>(() => MonsterRepository());
  }
}
