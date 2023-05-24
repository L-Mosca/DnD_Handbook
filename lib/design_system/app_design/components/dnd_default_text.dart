import 'package:flutter/cupertino.dart';

class DndDefaultText extends StatefulWidget {
  final String text;

  const DndDefaultText({Key? key, required this.text}) : super(key: key);

  @override
  State<DndDefaultText> createState() => _DndDefaultTextState();
}

class _DndDefaultTextState extends State<DndDefaultText> {

  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}
