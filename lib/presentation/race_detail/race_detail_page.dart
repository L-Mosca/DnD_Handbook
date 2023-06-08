import 'package:dnd_app/presentation/race_detail/bloc/race_detail_bloc.dart';
import 'package:dnd_app/presentation/race_detail/bloc/race_detail_state.dart';
import 'package:dnd_app/presentation/race_detail/widgets/race_dateil_loading.dart';
import 'package:dnd_app/presentation/race_detail/widgets/race_detail_content.dart';
import 'package:dnd_app/presentation/race_detail/widgets/race_detail_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/create_char/race/race_detail.dart';

class RaceDetailPage extends StatelessWidget {
  const RaceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RaceDetailBloc, RaceDetailState>(
      listener: (context, state) {
        _onRaceDetailClicked();
      },
      child: Container(
        child: _blocBuilder(),
      ),
    );
  }

  void _onRaceDetailClicked() {}

  BlocBuilder _blocBuilder() {
    return BlocBuilder<RaceDetailBloc, RaceDetailState>(
        builder: (context, state) {
      switch (state.status) {
        case RaceDetailStatus.loading:
          return _loadingContent();
        case RaceDetailStatus.error:
          return _errorContent();
        case RaceDetailStatus.success:
          return _pageContent(state.raceDetail);
        default:
          return _errorContent();
      }
    });
  }

  Widget _loadingContent() {
    return RaceDetailLoading();
  }

  Widget _errorContent() {
    return RaceDetailError();
  }

  Widget _pageContent(RaceDetail? raceDetail) {
    return raceDetail == null ? _errorContent() : RaceDetailContent(raceDetail: raceDetail);
  }
}
