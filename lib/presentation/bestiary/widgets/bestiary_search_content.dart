import 'package:dnd_app/design_system/app_design/base_widgets/dnd_text_field.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_bloc.dart';
import 'package:dnd_app/presentation/bestiary/bloc/bestiary_event.dart';
import 'package:dnd_app/values/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestiarySearchContent extends StatefulWidget {
  const BestiarySearchContent({Key? key, required this.searchFocusNode})
      : super(key: key);
  final FocusNode searchFocusNode;

  @override
  State<BestiarySearchContent> createState() => _BestiarySearchContentState();
}

class _BestiarySearchContentState extends State<BestiarySearchContent> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DndTextField(
              focusNode: widget.searchFocusNode,
              hintText: AppStrings.bestiarySearchHint,
              borderRadius: 0,
              controller: searchController,
              onChanged: (value) {
                _searchAction(value);
              },
              onEditingComplete: () {
                _searchAction(searchController.text);
              }),
        )
      ],
    );
  }

  void _searchAction(String query) {
    context.read<BestiaryBloc>().add(BestiaryFilterEvent(query: query));
  }
}
