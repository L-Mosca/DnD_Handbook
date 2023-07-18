import 'package:dnd_app/presentation/monster_detail/bloc/monster_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/monster_state.dart';

class MonsterPage extends StatelessWidget {
  const MonsterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MonsterBloc, MonsterState>(
      listener: (context, state) {
        _onMonsterChanged(context, state);
      },
      child: _blocBuilder(),
    );
  }

  void _onMonsterChanged(BuildContext context, MonsterState state) {}

  BlocBuilder _blocBuilder() {
    return BlocBuilder<MonsterBloc, MonsterState>(builder: (context, state) {
      switch (state.status) {
        case MonsterStatus.loading:
          return _loadingContent();
        case MonsterStatus.error:
          return _errorContent();
        case MonsterStatus.success:
          return _pageContent();
        default:
          return _errorContent();
      }
    });
  }

  Widget _loadingContent() {
    return Container(color: Colors.greenAccent);
  }

  Widget _errorContent() {
    return Container(color: Colors.blue);
  }

  Widget _pageContent() {
    return Container(color: Colors.orange);
  }
}
