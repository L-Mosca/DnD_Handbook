import 'package:dnd_app/presentation/create_char/bloc/create_char_bloc.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_event.dart';
import 'package:dnd_app/presentation/create_char/widgets/select_race/select_race_item.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/create_char/race/race.dart';

class SelectRace extends StatelessWidget {
  const SelectRace({Key? key, this.race}) : super(key: key);

  final Race? race;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: race?.results?.length,
        itemBuilder: (context, index) {
          final raceItem = race?.results?[index];
          return GestureDetector(
            onTap: () {
              _onRaceSelected(raceItem, context);
            }, child: Column(
            children: [
              SelectRaceItem(race: race?.results?[index]),
              const SizedBox(height: AppDimensions.marginDefault)
            ],
          ),
          );
        });
  }

  void _onRaceSelected(RaceList? race, BuildContext context) {
    context.read<CreateCharBloc>().add(RaceClickedEvent(race: race));
  }
}
