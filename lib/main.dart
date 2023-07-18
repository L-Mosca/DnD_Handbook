import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'flavor/build_flavor.dart';
import 'flavor/flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  buildFlavor(Flavor.prod);
}
