import 'package:dnd_app/domain/repositories/character/character_repository.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_event.dart';
import 'package:dnd_app/presentation/create_char/bloc/create_char_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCharBloc extends Bloc<CreateCharEvent, CreateCharState> {
  final CharacterRepository _characterRepository;
  CreateCharState _createCharState = const CreateCharState();

  CreateCharBloc(this._characterRepository) : super(const CreateCharState()) {
    on<CreateCharInitEvent>(_onLoad);
  }

  void _onLoad(
      CreateCharInitEvent event, Emitter<CreateCharState> emitter) async {
    _createCharState =
        _createCharState.copyWith(createCharStatus: CreateCharStatus.initial);
    emitter(_createCharState);
  }
}
