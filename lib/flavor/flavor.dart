import 'package:flutter/cupertino.dart';

import '../dnd_app.dart';
import 'build_flavor.dart';

void buildFlavor(Flavor flavor) {
  BuildFlavor.appFlavor = flavor;
  runApp(Builder(builder: (context) => DnDApp(context: context)));
}
