import 'dart:convert';

import 'package:dnd_app/domain/service/http_client/client_helper.dart';

import '../../models/monster/monster.dart';
import '../../models/monster/monster_details.dart';

class MonsterRepository {
  final ClientHelper _clientHelper = ClientHelper();

  Future<Monster?> fetchMonsters() async {
    final List<MonsterDetail> monsterDetailList = [];
    var response = await _clientHelper.getMonsterList();
    final jsonData = jsonDecode(response);
    var monsterList = Monster.fromJson(jsonData);
    /*for (int i = 0; i < monsterList.results!.length; i++) {
      var monsterIndex = monsterList.results?[i].index ?? '';
      var monsterDetail = await fetchMonsterDetail(monsterIndex);
      if (monsterDetail != null) {
        monsterDetailList.add(monsterDetail);
      }
    }*/
    return monsterList;
  }

  Future<MonsterDetail?> fetchMonsterDetail(String monsterIndex) async {
    var response = await _clientHelper.getMonsterDetail(monsterIndex);
    final jsonData = jsonDecode(response);
    final monsterDetail = MonsterDetail.fromJson(jsonData);
    return monsterDetail;
  }
}
