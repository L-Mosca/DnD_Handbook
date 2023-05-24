import 'package:flutter/cupertino.dart';

import '../../../domain/models/monster/Monster.dart';

class BestiaryList extends StatefulWidget {
  final List<Monster> monsterList;
  const BestiaryList({Key? key, required this.monsterList}) : super(key: key);

  @override
  State<BestiaryList> createState() => _BestiaryListState();
}

class _BestiaryListState extends State<BestiaryList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
