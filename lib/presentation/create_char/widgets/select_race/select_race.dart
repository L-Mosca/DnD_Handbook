import 'package:dnd_app/presentation/create_char/bloc/create_char_bloc.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_event.dart';
import 'package:dnd_app/presentation/create_char/widgets/select_race/select_race_item.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/create_char/race/race.dart';

enum ItemPosition { initial, middle, last }

class SelectRace extends StatefulWidget {
  const SelectRace({Key? key, this.race}) : super(key: key);

  final Race? race;

  @override
  State<SelectRace> createState() => _SelectRaceState();
}

PageController _controller = PageController();
int _currentPage = 0;

class _SelectRaceState extends State<SelectRace> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          _currentPage = index;
        },
        itemCount: widget.race?.results?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final raceItem = widget.race?.results?[index];
          return index == 0
              ? _raceContent(raceItem!, context, ItemPosition.initial)
              : index == widget.race!.results!.length - 1
                  ? _raceContent(raceItem!, context, ItemPosition.last)
                  : _raceContent(raceItem!, context, ItemPosition.middle);
        });
  }

  Widget _raceContent(
      RaceList raceItem, BuildContext context, ItemPosition itemPosition) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        itemPosition == ItemPosition.last || itemPosition == ItemPosition.middle
            ? _leftArrow()
            : const SizedBox(),
        _raceItem(raceItem, context),
        itemPosition == ItemPosition.initial ||
                itemPosition == ItemPosition.middle
            ? _rightArrow()
            : const SizedBox()
      ],
    );
  }

  Widget _leftArrow() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.jumpToPage(_currentPage - 1);
        });
      },
      child: const Row(children: [
        SizedBox(width: AppDimensions.marginMini),
        Icon(Icons.arrow_back_ios_new_outlined, color: Colors.red)
      ]),
    );
  }

  Widget _rightArrow() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.jumpToPage(_currentPage + 1);
        });
      },
      child: const Row(children: [
        Icon(Icons.arrow_forward_ios, color: Colors.red),
        SizedBox(width: AppDimensions.marginMini)
      ]),
    );
  }

  Widget _raceItem(RaceList raceItem, BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              _onRaceSelected(raceItem, context);
            },
            child: Column(children: [
              Expanded(child: SelectRaceItem(race: raceItem)),
            ])));
  }

  void _onRaceSelected(RaceList? race, BuildContext context) {
    context.read<CreateCharBloc>().add(RaceClickedEvent(race: race));
  }
}
