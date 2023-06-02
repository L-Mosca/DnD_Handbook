import 'package:get/get.dart';

import '../../domain/repositories/character/character_repository.dart';

class CreateCharBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterRepository>(() => CharacterRepository());
  }

}