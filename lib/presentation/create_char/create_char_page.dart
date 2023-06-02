import 'package:dnd_app/presentation/create_char/bloc/create_char_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/create_char_state.dart';

class CreateCharPage extends StatelessWidget {
  const CreateCharPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCharBloc, CreateCharState>(
      listener: (context, state) {
        _onCreateCharClicked();
      },
      child: Column(
        children: [Container(color: Colors.red, height: 200, width: 200)],
      ),
    );
  }

  void _onCreateCharClicked() {}
}
