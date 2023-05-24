class Monster {
  Monster({
      num? count, 
      List<Results>? results,}){
    _count = count;
    _results = results;
}

  Monster.fromJson(dynamic json) {
    _count = json['count'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _count;
  List<Results>? _results;
Monster copyWith({  num? count,
  List<Results>? results,
}) => Monster(  count: count ?? _count,
  results: results ?? _results,
);
  num? get count => _count;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      String? index, 
      String? name, 
      String? url,}){
    _index = index;
    _name = name;
    _url = url;
}

  Results.fromJson(dynamic json) {
    _index = json['index'];
    _name = json['name'];
    _url = json['url'];
  }
  String? _index;
  String? _name;
  String? _url;
Results copyWith({  String? index,
  String? name,
  String? url,
}) => Results(  index: index ?? _index,
  name: name ?? _name,
  url: url ?? _url,
);
  String? get index => _index;
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['index'] = _index;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}