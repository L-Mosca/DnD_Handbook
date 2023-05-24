import '../../../base/state/base_state.dart';

enum BestiaryStatus { loading, initial, empty, error, success }

class BestiaryState implements Copyable<BestiaryState> {

  @override
  BestiaryState copy() {
    return BestiaryState();
  }

  @override
  BestiaryState copyWith() {
    return BestiaryState();
  }

}


