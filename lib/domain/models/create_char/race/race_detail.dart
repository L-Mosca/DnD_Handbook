class RaceDetail {
  String? index;
  String? name;
  int? speed;
  List<AbilityBonuses>? abilityBonuses;
  String? alignment;
  String? age;
  String? size;
  String? sizeDescription;
  List<StartingProficiencies>? startingProficiencies;
  List<Languages>? languages;
  String? languageDesc;
  List<Traits>? traits;
  List<SubRaces>? subRaces;
  String? url;

  RaceDetail(
      {this.index,
      this.name,
      this.speed,
      this.abilityBonuses,
      this.alignment,
      this.age,
      this.size,
      this.sizeDescription,
      this.startingProficiencies,
      this.languages,
      this.languageDesc,
      this.traits,
      this.subRaces,
      this.url});

  RaceDetail.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    speed = json['speed'];
    if (json['ability_bonuses'] != null) {
      abilityBonuses = <AbilityBonuses>[];
      json['ability_bonuses'].forEach((v) {
        abilityBonuses!.add(AbilityBonuses.fromJson(v));
      });
    }
    alignment = json['alignment'];
    age = json['age'];
    size = json['size'];
    sizeDescription = json['size_description'];
    if (json['starting_proficiencies'] != null) {
      startingProficiencies = <StartingProficiencies>[];
      json['starting_proficiencies'].forEach((v) {
        startingProficiencies!.add(StartingProficiencies.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    languageDesc = json['language_desc'];
    if (json['traits'] != null) {
      traits = <Traits>[];
      json['traits'].forEach((v) {
        traits!.add(Traits.fromJson(v));
      });
    }
    if (json['subraces'] != null) {
      subRaces = <SubRaces>[];
      json['subraces'].forEach((v) {
        subRaces!.add(SubRaces.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['name'] = name;
    data['speed'] = speed;
    if (abilityBonuses != null) {
      data['ability_bonuses'] = abilityBonuses!.map((v) => v.toJson()).toList();
    }
    data['alignment'] = alignment;
    data['age'] = age;
    data['size'] = size;
    data['size_description'] = sizeDescription;
    if (startingProficiencies != null) {
      data['starting_proficiencies'] =
          startingProficiencies!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    data['language_desc'] = languageDesc;
    if (traits != null) {
      data['traits'] = traits!.map((v) => v.toJson()).toList();
    }
    if (subRaces != null) {
      data['subraces'] = subRaces!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    return data;
  }

  @override
  String toString() {
    return 'RaceDetail(index: $index, name: $name, speed: $speed, abilityBonuses: $abilityBonuses, alignment: $alignment, age: $age, size: $size, sizeDescription: $sizeDescription, startingProficiencies: $startingProficiencies, languages: $languages, languageDesc: $languageDesc, traits: $traits, subRaces: $subRaces, url: $url)';
  }
}

class AbilityBonuses {
  AbilityScore? abilityScore;
  int? bonus;

  AbilityBonuses({this.abilityScore, this.bonus});

  AbilityBonuses.fromJson(Map<String, dynamic> json) {
    abilityScore = json['ability_score'] != null
        ? AbilityScore.fromJson(json['ability_score'])
        : null;
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilityScore != null) {
      data['ability_score'] = abilityScore!.toJson();
    }
    data['bonus'] = bonus;
    return data;
  }

  @override
  String toString() {
    return 'AbilityBonuses{abilityScore: $abilityScore, bonus: $bonus}';
  }
}

class AbilityScore {
  String? index;
  String? name;
  String? url;

  AbilityScore({this.index, this.name, this.url});

  AbilityScore.fromJson(Map<String, dynamic> json) {
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
    return 'AbilityScore{index: $index, name: $name, url: $url}';
  }
}

class SubRaces {
  String? index;
  String? name;
  String? url;

  SubRaces({this.index, this.name, this.url});

  SubRaces.fromJson(Map<String, dynamic> json) {
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
    return 'SubRaces{index: $index, name: $name, url: $url}';
  }
}

class Traits {
  String? index;
  String? name;
  String? url;

  Traits({this.index, this.name, this.url});

  Traits.fromJson(Map<String, dynamic> json) {
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
    return 'Traits{index: $index, name: $name, url: $url}';
  }
}

class Languages {
  String? index;
  String? name;
  String? url;

  Languages({this.index, this.name, this.url});

  Languages.fromJson(Map<String, dynamic> json) {
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
    return 'Languages{index: $index, name: $name, url: $url}';
  }
}

class StartingProficiencies {
  String? index;
  String? name;
  String? url;

  StartingProficiencies({this.index, this.name, this.url});

  StartingProficiencies.fromJson(Map<String, dynamic> json) {
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
    return 'StartingProficiencies{index: $index, name: $name, url: $url}';
  }
}
