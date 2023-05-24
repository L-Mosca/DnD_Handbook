import 'package:dnd_app/presentation/bestiary/bloc/bestiary_state.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_empty_list.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_error.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_loading.dart';
import 'package:dnd_app/presentation/bestiary/widgets/betiary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bestiary_bloc.dart';

class BestiaryPage extends StatefulWidget {
  const BestiaryPage({Key? key}) : super(key: key);

  @override
  State<BestiaryPage> createState() => _BestiaryPageState();
}

class _BestiaryPageState extends State<BestiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blocBuilder(),
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<BestiaryBloc, BestiaryState>(builder: (context, state) {
      return _emptyContent();
    });
    /*switch (state.runtimeType) {
        case BestiarySuccessState:
          return _monsterList();
        case BestiaryLoadingState:
          return _loadingContent();
        case BestiaryErrorState:
          return _errorContent();
        default:
          return _emptyContent();
      }*/
  }

  void _onBestiaryStateChanged(BestiaryState state, BuildContext context) {
    BlocListener<BestiaryBloc, BestiaryState>(listener: (context, state) {
      _onBestiaryStateChanged(state, context);
    });
  }

  Widget _loadingContent() {
    return const BestiaryLoading();
  }

  Widget _errorContent() {
    return const BestiaryError();
  }

  Widget _emptyContent() {
    return const BestiaryEmptyList();
  }

  Widget _monsterList() {
    return const BestiaryList(
      monsterList: [],
    );
  }
}
