import 'dart:async';

import 'package:dnd_app/domain/models/monster/monster_details.dart';
import 'package:dnd_app/presentation/monster_detail/bloc/monster_bloc.dart';
import 'package:dnd_app/presentation/monster_detail/widgets/monster_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'bloc/monster_state.dart';

class MonsterPage extends StatefulWidget {
  const MonsterPage({Key? key}) : super(key: key);

  @override
  State<MonsterPage> createState() => _MonsterPageState();
}

class _MonsterPageState extends State<MonsterPage> {
  double _contentOpacity = 0.0;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          return _pageContent(state.monsterDetail!);
        default:
          return _errorContent();
      }
    });
  }

  Widget _loadingContent() {
    return Lottie.asset('lib/assets/images/gif_monster_loading.json');
  }

  Widget _errorContent() {
    return Container(color: Colors.blue);
  }

  Widget _pageContent(MonsterDetail monsterDetail) {
    _timer = Timer(const Duration(milliseconds: 200), () {
      setState(() => _contentOpacity = 1.0);
    });

    return AnimatedOpacity(
      opacity: _contentOpacity,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'lib/assets/images/img_cover_background.png'),
                  fit: BoxFit.cover)),
          child: MonsterData(monsterDetail: monsterDetail)),
    );
  }
}
