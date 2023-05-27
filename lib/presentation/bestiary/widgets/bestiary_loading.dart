import 'package:flutter/cupertino.dart';

class BestiaryLoading extends StatefulWidget {
  const BestiaryLoading({Key? key}) : super(key: key);

  @override
  State<BestiaryLoading> createState() => _BestiaryLoadingState();
}

class _BestiaryLoadingState extends State<BestiaryLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('lib/assets/images/img_loading_gif.gif'),
    );
  }
}
