import 'dart:convert';

import 'package:dnd_app/domain/models/create_char/race/race.dart';
import 'package:dnd_app/domain/models/create_char/race/race_detail.dart';
import 'package:dnd_app/domain/service/http_client/client_helper.dart';

class CharacterRepository {
  final ClientHelper _clientHelper = ClientHelper();

  Future<Race?> fetchRaces() async {
    var response = await _clientHelper.getRaceList();
    final jsonData = jsonDecode(response);
    var raceList = Race.fromJson(jsonData);

    return raceList;
  }

  Future<RaceDetail?> fetchRaceDetail(String index) async {
    var response = await _clientHelper.getRaceDetail(index);
    final jsonData = jsonDecode(response);
    var raceDetail = RaceDetail.fromJson(jsonData);

    return raceDetail;
  }
}