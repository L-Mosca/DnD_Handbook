class Class {
  int? count;
  List<Results>? results;

  Class({this.count, this.results});

  Class.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
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
    return 'Class: (count: $count, results: $results)';
  }
}

class Results {
  String? index;
  String? name;
  String? url;

  Results({this.index, this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
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
    return 'Results(index: $index, name: $name, url: $url)';
  }
}
