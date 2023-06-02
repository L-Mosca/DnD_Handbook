import 'package:dnd_app/base/state/base_state.dart';

enum CreateCharStatus { initial }

class CreateCharState implements Copyable<CreateCharState> {
  const CreateCharState({this.status = CreateCharStatus.initial});

  final CreateCharStatus status;

  @override
  CreateCharState copy() {
    return CreateCharState(status: status);
  }

  @override
  CreateCharState copyWith({CreateCharStatus? createCharStatus}) {
    return CreateCharState(status: createCharStatus ?? status);
  }
}
