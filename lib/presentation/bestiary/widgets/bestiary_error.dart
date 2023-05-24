import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestiaryError extends StatefulWidget {
  const BestiaryError({Key? key}) : super(key: key);

  @override
  State<BestiaryError> createState() => _BestiaryErrorState();
}

class _BestiaryErrorState extends State<BestiaryError> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.red,);
  }
}
