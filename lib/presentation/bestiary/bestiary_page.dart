import 'package:dnd_app/design_system/app_design/base_widgets/dnd_default_text.dart';
import 'package:dnd_app/domain/models/monster/monster.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_state.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_empty_list.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_error.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_loading.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_search_content.dart';
import 'package:dnd_app/presentation/bestiary/widgets/bestiary_list.dart';
import 'package:dnd_app/values/app_dimensions.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../design_system/theme_data/dark_theme_provider.dart';
import 'bloc/bestiary_bloc.dart';

class BestiaryPage extends StatefulWidget {
  const BestiaryPage({Key? key}) : super(key: key);

  @override
  State<BestiaryPage> createState() => _BestiaryPageState();
}

class _BestiaryPageState extends State<BestiaryPage> {
  final TextEditingController controller = TextEditingController();
  final themeState = Get.find<DarkThemeProvider>();

  List<Results> list = [];

  @override
  void initState() {
    super.initState();
    _loadMonsterList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _loadMonsterList() {
    final bloc = context.read<BestiaryBloc>();
    bloc.add(BestiaryInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BestiaryBloc, BestiaryState>(
      listener: (context, state) {
        _onBestiaryStateChanged(state, context);
      },
      child: SafeArea(
        child: Column(
          children: [
        const SizedBox(height: AppDimensions.marginBig),
        _pageTitle(),
        const SizedBox(height: 30),
        BestiarySearchContent(controller: controller, monster: list),
        const SizedBox(height: 20),
        Expanded(child: _pageContent())
          ],
        ),
      ),
    );
  }

  Widget _pageContent() {
    return Column(
      children: [
        _blocBuilder(),
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
        )
      ],
    );
  }

  DndDefaultText _pageTitle() {
    return const DndDefaultText(
        text: AppStrings.bestiaryPageTitle,
        fontSize: AppDimensions.textSizeHuge,
        fontWeight: FontWeight.w400);
  }

  Widget _blocBuilder() {
    return BlocBuilder<BestiaryBloc, BestiaryState>(builder: (context, state) {
      switch (state.status) {
        case BestiaryStatus.success:
          return _monsterList(state.monster!);
        case BestiaryStatus.loading:
          return _loadingContent();
        case BestiaryStatus.error:
          return _errorContent();
        default:
          return _emptyContent();
      }
    });
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

  Widget _monsterList(Monster monsterList) {
    return BestiaryList(
      monsterList: monsterList,
    );
  }
}
