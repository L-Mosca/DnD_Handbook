import 'package:dnd_app/domain/service/http_client/base_client.dart';
import 'package:dnd_app/domain/service/http_client/client_constants.dart';

class ClientHelper extends BaseClient {
  getMonsterList() async {
    return await getRequest(ClientConstants.fetchMonsters);
  }

  getMonsterDetail(String monsterIndex) async {
    return await getRequest(
        '${ClientConstants.fetchMonsterDetail}$monsterIndex');
  }

  getRaceList() async {
    return await getRequest(ClientConstants.fetchRaces);
  }

  getRaceDetail(String raceIndex) async {
    return await getRequest('${ClientConstants.fetchRaces}/$raceIndex');
  }
}