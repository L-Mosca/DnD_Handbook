import 'package:get/get.dart';

import '../../domain/repositories/monster/monster_repository.dart';

class MonsterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonsterRepository>(() => MonsterRepository());
  }
}
