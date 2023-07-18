import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_bloc.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../design_system/app_design/base_widgets/dnd_default_button.dart';
import '../../domain/models/create_char/race/race.dart';
import 'bloc/create_char_event.dart';
import 'bloc/create_char_state.dart';

class CreateCharPage extends StatefulWidget {
  const CreateCharPage({Key? key}) : super(key: key);

  @override
  State<CreateCharPage> createState() => _CreateCharPageState();
}

class _CreateCharPageState extends State<CreateCharPage> {
  PageController _pageController = PageController();
  Race? race;
  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCharBloc, CreateCharState>(
      listener: (context, state) {
        _onCreateCharClicked(context, state);
      },
      child: _blocBuilder(),
    );
  }

  BlocBuilder _blocBuilder() {
    return BlocBuilder<CreateCharBloc, CreateCharState>(
        builder: (context, state) {
      pages = state.widgetList;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppDimensions.marginLarge),
          _pageTitle(),
          const SizedBox(height: AppDimensions.marginLarge),
          state.widgetList.isEmpty ? _loadContent() : _pageList(),
          const SizedBox(height: AppDimensions.marginDefault),
          _pageButton(),
          const SizedBox(height: AppDimensions.marginDefault),
        ],
      );
    });
  }

  void _onCreateCharClicked(BuildContext context, CreateCharState state) {
    switch (state.status) {
      case CreateCharStatus.raceClicked:
        Get.toNamed(RoutesConstants.routeRaceDetail, arguments: {
          RoutesConstants.argumentRaceDetailIndex: state.raceSelected!.index
        });
        break;
      case CreateCharStatus.back:
        _pageController.jumpToPage((state.pageIndex! - 1).toInt());
        break;
      case CreateCharStatus.next:
        _pageController.jumpToPage(state.pageIndex!.toInt());
        break;
      default:
        break;
    }
  }

  void _onPageChanged(int index) {}

  Widget _loadContent() {
    return Container(width: 200, height: 200, color: Colors.red);
  }

  Widget _pageTitle() {
    return const DndDefaultText(
        text: AppStrings.createChar,
        fontSize: AppDimensions.textSizeExtraBig,
        fontWeight: FontWeight.w600);
  }

  Widget _pageList() {
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int index) {
          _onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
        itemCount: pages.length,
      ),
    );
  }

  Widget _pageButton() {
    return Row(
      children: [
        _backwardButton(),
        _forwardButton(),
      ],
    );
  }

  Widget _forwardButton() {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.marginExtraBig),
          child: DndDefaultButton(
            onPressed: () {
              context
                  .read<CreateCharBloc>()
                  .add(CreateCharNextStep(pageIndex: _pageController.page));
            },
            text: AppStrings.next,
          )),
    );
  }

  Widget _backwardButton() {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.marginExtraBig),
          child: DndDefaultButton(
            onPressed: () {
              setState(() {
                context
                    .read<CreateCharBloc>()
                    .add(CreateCharBackStep(pageIndex: _pageController.page));
              });
            },
            text: AppStrings.back,
          )),
    );
  }
}
