class Race {
  int? count;
  List<RaceList>? results;

  Race({this.count, this.results});

  Race.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <RaceList>[];
      json['results'].forEach((v) {
        results!.add(RaceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Race(count: $count, results: $results)';
  }
}

class RaceList {
  String? index;
  String? name;
  String? url;

  RaceList({this.index, this.name, this.url});

  RaceList.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'RaceList(index: $index, name: $name, url: $url)';
  }
}
