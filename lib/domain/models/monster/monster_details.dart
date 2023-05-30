import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MonsterDetail {
  String? index;
  String? name;
  String? size;
  String? type;
  String? alignment;
  @JsonKey(name: 'armor_class')
  List<ArmorClass>? armorClass;
  @JsonKey(name: 'hit_points')
  int? hitPoints;
  @JsonKey(name: 'hit_dice')
  String? hitDice;
  @JsonKey(name: 'hit_points_roll')
  String? hitPointsRoll;
  Speed? speed;
  int? strength;
  int? dexterity;
  int? constitution;
  int? intelligence;
  int? wisdom;
  int? charisma;
  List<Proficiencies>? proficiencies;
  @JsonKey(name: 'damage_vulnerabilities')
  List<String>? damageVulnerabilities;
  @JsonKey(name: 'damage_resistance')
  List<String>? damageResistances;
  List<String>? damageImmunities;
  //@JsonKey(name: 'condition_immunities')
  //List<String>? conditionImmunities;
  Senses? senses;
  String? languages;
  num? challengeRating;
  int? xp;
  @JsonKey(name: 'special_abilities')
  List<SpecialAbilities>? specialAbilities;
  List<Actions>? actions;
  @JsonKey(name: 'legendary_actions')
  List<LegendaryActions>? legendaryActions;
  String? url;
  String? image;
  String? subtype;


/*  @override
  String toString() {
    return 'MonsterDetail(index: $index, name: $name, size: $size, type: $type, alignment: $alignment, '
        'armorClass: $armorClass, hitPoints: $hitPoints, hitDice: $hitDice, hitPointsRoll: $hitPointsRoll, '
        'speed: $speed, strength: $strength, dexterity: $dexterity, constitution: $constitution, '
        'intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma, proficiencies: $proficiencies, '
        'damageVulnerabilities: $damageVulnerabilities, damageResistances: $damageResistances, '
        'damageImmunities: $damageImmunities, conditionImmunities: $conditionImmunities, '
        'senses: $senses, languages: $languages, challengeRating: $challengeRating, xp: $xp, '
        'specialAbilities: $specialAbilities, actions: $actions, legendaryActions: $legendaryActions, url: $url)';
  }*/

  MonsterDetail({
    this.index,
    this.name,
    this.size,
    this.type,
    this.alignment,
    this.armorClass,
    this.hitPoints,
    this.hitDice,
    this.hitPointsRoll,
    this.speed,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.proficiencies,
    this.damageVulnerabilities,
    this.damageResistances,
    this.damageImmunities,
    //this.conditionImmunities,
    this.senses,
    this.languages,
    this.challengeRating,
    this.xp,
    this.specialAbilities,
    this.actions,
    this.legendaryActions,
    this.url,
  });

  MonsterDetail.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    size = json['size'];
    type = json['type'];
    alignment = json['alignment'];
    if (json['armor_class'] != null) {
      armorClass = <ArmorClass>[];
      json['armor_class'].forEach((v) {
        armorClass!.add(ArmorClass.fromJson(v));
      });
    }
    hitPoints = json['hit_points'];
    hitDice = json['hit_dice'];
    hitPointsRoll = json['hit_points_roll'];
    speed = json['speed'] != null ? Speed.fromJson(json['speed']) : null;
    strength = json['strength'];
    dexterity = json['dexterity'];
    constitution = json['constitution'];
    intelligence = json['intelligence'];
    wisdom = json['wisdom'];
    charisma = json['charisma'];
    if (json['proficiencies'] != null) {
      proficiencies = <Proficiencies>[];
      json['proficiencies'].forEach((v) {
        proficiencies!.add(Proficiencies.fromJson(v));
      });
    }
    damageVulnerabilities = json['damage_vulnerabilities'] != null
        ? List<String>.from(json['damage_vulnerabilities'])
        : null;
    damageResistances = json['damage_resistances'] != null
        ? List<String>.from(json['damage_resistances'])
        : null;
    damageImmunities = json['damage_immunities'] != null
        ? List<String>.from(json['damage_immunities'])
        : null;
    //conditionImmunities = json['condition_immunities'] != null
    //    ? List<String>.from(json['condition_immunities'])
    //    : null;
    senses = json['senses'] != null ? Senses.fromJson(json['senses']) : null;
    languages = json['languages'];
    challengeRating = json['challenge_rating'];
    xp = json['xp'];
    if (json['special_abilities'] != null) {
      specialAbilities = <SpecialAbilities>[];
      json['special_abilities'].forEach((v) {
        specialAbilities!.add(SpecialAbilities.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(Actions.fromJson(v));
      });
    }
    if (json['legendary_actions'] != null) {
      legendaryActions = <LegendaryActions>[];
      json['legendary_actions'].forEach((v) {
        legendaryActions!.add(LegendaryActions.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['name'] = name;
    data['size'] = size;
    data['type'] = type;
    data['alignment'] = alignment;
    if (armorClass != null) {
      data['armor_class'] = armorClass!.map((v) => v.toJson()).toList();
    }
    data['hit_points'] = hitPoints;
    data['hit_dice'] = hitDice;
    data['hit_points_roll'] = hitPointsRoll;
    data['speed'] = speed != null ? speed!.toJson() : null;
    data['strength'] = strength;
    data['dexterity'] = dexterity;
    data['constitution'] = constitution;
    data['intelligence'] = intelligence;
    data['wisdom'] = wisdom;
    data['charisma'] = charisma;
    if (proficiencies != null) {
      data['proficiencies'] = proficiencies!.map((v) => v.toJson()).toList();
    }
    data['damage_vulnerabilities'] = damageVulnerabilities;
    data['damage_resistances'] = damageResistances;
    data['damage_immunities'] = damageImmunities;
    //data['condition_immunities'] = conditionImmunities;
    data['senses'] = senses != null ? senses!.toJson() : null;
    data['languages'] = languages;
    data['challenge_rating'] = challengeRating;
    data['xp'] = xp;
    if (specialAbilities != null) {
      data['special_abilities'] =
          specialAbilities!.map((v) => v.toJson()).toList();
    }
    if (actions != null) {
      data['actions'] = actions!.map((v) => v.toJson()).toList();
    }
    if (legendaryActions != null) {
      data['legendary_actions'] =
          legendaryActions!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    return data;
  }
}

class ArmorClass {
  int? value;
  String? notes;

  ArmorClass({this.value, this.notes});

  ArmorClass.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['notes'] = notes;
    return data;
  }
}

class Speed {
  String? walk;
  String? swim;

  Speed({this.walk, this.swim});

  Speed.fromJson(Map<String, dynamic> json) {
    walk = json['walk'];
    swim = json['swim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walk'] = walk;
    data['swim'] = swim;
    return data;
  }
}

class Proficiencies {
  String? name;
  int? value;

  Proficiencies({this.name, this.value});

  Proficiencies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Senses {
  String? darkvision;
  int? passivePerception;

  Senses({this.darkvision, this.passivePerception});

  Senses.fromJson(Map<String, dynamic> json) {
    darkvision = json['darkvision'];
    passivePerception = json['passive_perception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['darkvision'] = darkvision;
    data['passive_perception'] = passivePerception;
    return data;
  }
}

class SpecialAbilities {
  String? name;
  String? desc;

  SpecialAbilities({this.name, this.desc});

  SpecialAbilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    return data;
  }
}

class Actions {
  String? name;
  String? desc;

  Actions({this.name, this.desc});

  Actions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    return data;
  }
}

class LegendaryActions {
  String? name;
  String? desc;

  LegendaryActions({this.name, this.desc});

  LegendaryActions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    return data;
  }
}
