import 'package:dnd_app/domain/repositories/character/character_repository.dart';
import 'package:get/get.dart';

class RaceDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterRepository>(() => CharacterRepository());
  }

}