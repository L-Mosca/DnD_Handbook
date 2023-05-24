import 'package:dnd_app/domain/service/http_client/client_helper.dart';

import '../../models/monster/Monster.dart';

class MonsterRepository {
  final ClientHelper _clientHelper = ClientHelper();

  Future<List<Monster>?> fetchMonsters() async {

  }
}