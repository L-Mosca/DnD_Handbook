import 'package:dnd_app/design_system/app_design/base_widgets/dnd_card.dart';
import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/presentation/home/bloc/home_event.dart';
import 'package:dnd_app/routes/routes_constants.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../design_system/app_design/base_widgets/dnd_default_button.dart';
import '../../design_system/theme_data/dark_theme_provider.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final themeState = Get.find<DarkThemeProvider>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        _onHomeClicked(context, state);
      },
      child: Container(
        child: _blocBuilder(),
      ),
    );
  }

  BlocBuilder _blocBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Column(
        children: [
          const SizedBox(height: 100),
          _createCharItem(context),
          const SizedBox(height: AppDimensions.marginDefault),
          _bestiaryItem(context),
          Obx(
            () => SwitchListTile(
              secondary: Icon(
                themeState.darkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
              value: themeState.darkTheme,
              onChanged: (bool value) {
                themeState.setDarkTheme = value;
                Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          const SizedBox(height: 50),
        ],
      );
    });
  }

  Widget _createCharItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(HomeCreateCharClickedEvent());
      },
      child: _menuItems('lib/assets/images/ic_pen.png', AppStrings.createChar),
    );
  }

  Widget _bestiaryItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(HomeBestiaryClickedEvent());
      },
      child: _menuItems(
          'lib/assets/images/ic_bestiary.png', AppStrings.bestiaryPageTitle),
    );
  }

  Widget _menuItems(String imageUrl, String itemName) {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppDimensions.marginExtraBig),
        child: DndCard(child: _buildMenuItem(imageUrl, itemName)));
  }

  Widget _buildMenuItem(String imageUrl, String itemName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppDimensions.marginLarge),
        Image.asset(imageUrl, width: 100),
        const SizedBox(height: AppDimensions.marginDefault),
        Align(
            alignment: Alignment.bottomCenter,
            child: DndDefaultText(
                text: itemName, fontSize: AppDimensions.textSizeHuge)),
        const SizedBox(height: AppDimensions.marginLarge)
      ],
    );
  }

  void _onHomeClicked(BuildContext context, HomeState state) {
    // ignore: missing_enum_constant_in_switch
    switch (state.status) {
      case HomeStatus.bestiaryClicked:
        Get.toNamed(RoutesConstants.routeBestiary);
        break;
      case HomeStatus.createCharClicked:
        Get.toNamed(RoutesConstants.routeCreateChar);
        break;
    }
  }
}
