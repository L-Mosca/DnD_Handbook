class MonsterDetail {
  String? index;
  String? name;
  String? size;
  String? type;
  String? alignment;
  List<ArmorClass>? armorClass;
  int? hitPoints;
  String? hitDice;
  String? hitPointsRoll;
  Speed? speed;
  int? strength;
  int? dexterity;
  int? constitution;
  int? intelligence;
  int? wisdom;
  int? charisma;
  List<Proficiencies>? proficiencies;
  List<void>? damageVulnerabilities;
  List<void>? damageResistances;
  List<void>? damageImmunities;
  List<void>? conditionImmunities;
  Senses? senses;
  String? languages;
  int? challengeRating;
  int? xp;
  List<SpecialAbilities>? specialAbilities;
  List<Actions>? actions;
  List<LegendaryActions>? legendaryActions;
  String? image;
  String? url;

  // nome, imagem, alinhamento, tipo

  MonsterDetail(
      {this.index,
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
        this.conditionImmunities,
        this.senses,
        this.languages,
        this.challengeRating,
        this.xp,
        this.specialAbilities,
        this.actions,
        this.legendaryActions,
        this.image,
        this.url});

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
    if (json['damage_vulnerabilities'] != null) {
      damageVulnerabilities = <Null>[];
      json['damage_vulnerabilities'].forEach((v) {
        damageVulnerabilities!.add(Null.from(v));
      });
    }
    if (json['damage_resistances'] != null) {
      damageResistances = <Null>[];
      json['damage_resistances'].forEach((v) {
        damageResistances!.add(Null.fromJson(v));
      });
    }
    if (json['damage_immunities'] != null) {
      damageImmunities = <Null>[];
      json['damage_immunities'].forEach((v) {
        damageImmunities!.add(void.fromJson(v));
      });
    }
    if (json['condition_immunities'] != null) {
      conditionImmunities = <Null>[];
      json['condition_immunities'].forEach((v) {
        conditionImmunities!.add(void.fromJson(v));
      });
    }
    senses =
    json['senses'] != null ? Senses.fromJson(json['senses']) : null;
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
    image = json['image'];
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
    if (speed != null) {
      data['speed'] = speed!.toJson();
    }
    data['strength'] = strength;
    data['dexterity'] = dexterity;
    data['constitution'] = constitution;
    data['intelligence'] = intelligence;
    data['wisdom'] = wisdom;
    data['charisma'] = charisma;
    if (proficiencies != null) {
      data['proficiencies'] =
          proficiencies!.map((v) => v.toJson()).toList();
    }
    if (damageVulnerabilities != null) {
      data['damage_vulnerabilities'] =
          damageVulnerabilities!.map((v) => v.toJson()).toList();
    }
    if (damageResistances != null) {
      data['damage_resistances'] =
          damageResistances!.map((v) => v.toJson()).toList();
    }
    if (damageImmunities != null) {
      data['damage_immunities'] =
          damageImmunities!.map((v) => v.toJson()).toList();
    }
    if (conditionImmunities != null) {
      data['condition_immunities'] =
          conditionImmunities!.map((v) => v.toJson()).toList();
    }
    if (senses != null) {
      data['senses'] = senses!.toJson();
    }
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
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class ArmorClass {
  String? type;
  int? value;

  ArmorClass({this.type, this.value});

  ArmorClass.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
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
  int? value;
  Proficiency? proficiency;

  Proficiencies({this.value, this.proficiency});

  Proficiencies.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    proficiency = json['proficiency'] != null
        ? Proficiency.fromJson(json['proficiency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    if (proficiency != null) {
      data['proficiency'] = proficiency!.toJson();
    }
    return data;
  }
}

class Proficiency {
  String? index;
  String? name;
  String? url;

  Proficiency({this.index, this.name, this.url});

  Proficiency.fromJson(Map<String, dynamic> json) {
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
  Dc? dc;

  SpecialAbilities({this.name, this.desc, this.dc});

  SpecialAbilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    dc = json['dc'] != null ? Dc.fromJson(json['dc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    if (dc != null) {
      data['dc'] = dc!.toJson();
    }
    return data;
  }
}

class Dc {
  Proficiency? dcType;
  int? dcValue;
  String? successType;

  Dc({this.dcType, this.dcValue, this.successType});

  Dc.fromJson(Map<String, dynamic> json) {
    dcType = json['dc_type'] != null
        ? Proficiency.fromJson(json['dc_type'])
        : null;
    dcValue = json['dc_value'];
    successType = json['success_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dcType != null) {
      data['dc_type'] = dcType!.toJson();
    }
    data['dc_value'] = dcValue;
    data['success_type'] = successType;
    return data;
  }
}

class Actions {
  String? name;
  String? multiattackType;
  String? desc;
  List<Actions>? actions;
  int? attackBonus;
  Dc? dc;
  List<Damage>? damage;
  Usage? usage;

  Actions(
      {this.name,
        this.multiattackType,
        this.desc,
        this.actions,
        this.attackBonus,
        this.dc,
        this.damage,
        this.usage});

  Actions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    multiattackType = json['multiattack_type'];
    desc = json['desc'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(Actions.fromJson(v));
      });
    }
    attackBonus = json['attack_bonus'];
    dc = json['dc'] != null ? Dc.fromJson(json['dc']) : null;
    if (json['damage'] != null) {
      damage = <Damage>[];
      json['damage'].forEach((v) {
        damage!.add(Damage.fromJson(v));
      });
    }
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['multiattack_type'] = this.multiattackType;
    data['desc'] = this.desc;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    data['attack_bonus'] = this.attackBonus;
    if (this.dc != null) {
      data['dc'] = this.dc!.toJson();
    }
    if (this.damage != null) {
      data['damage'] = this.damage!.map((v) => v.toJson()).toList();
    }
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    return data;
  }
}

class Actions {
  String? actionName;
  int? count;
  String? type;

  Actions({this.actionName, this.count, this.type});

  Actions.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'];
    count = json['count'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action_name'] = actionName;
    data['count'] = count;
    data['type'] = type;
    return data;
  }
}

class Damage {
  Proficiency? damageType;
  String? damageDice;

  Damage({this.damageType, this.damageDice});

  Damage.fromJson(Map<String, dynamic> json) {
    damageType = json['damage_type'] != null
        ? Proficiency.fromJson(json['damage_type'])
        : null;
    damageDice = json['damage_dice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (damageType != null) {
      data['damage_type'] = damageType!.toJson();
    }
    data['damage_dice'] = damageDice;
    return data;
  }
}

class Usage {
  String? type;
  int? times;

  Usage({this.type, this.times});

  Usage.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    times = json['times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['times'] = times;
    return data;
  }
}

class LegendaryActions {
  String? name;
  String? desc;
  int? attackBonus;
  List<Damage>? damage;

  LegendaryActions({this.name, this.desc, this.attackBonus, this.damage});

  LegendaryActions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    attackBonus = json['attack_bonus'];
    if (json['damage'] != null) {
      damage = <Damage>[];
      json['damage'].forEach((v) {
        damage!.add(Damage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    data['attack_bonus'] = attackBonus;
    if (damage != null) {
      data['damage'] = damage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}