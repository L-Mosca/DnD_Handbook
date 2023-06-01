import 'package:dnd_app/base/state/base_state.dart';

enum HomeStatus { initial, bestiaryClicked }

class HomeState implements Copyable<HomeState> {
  const HomeState({this.status = HomeStatus.initial});

  final HomeStatus status;

  @override
  HomeState copy() {
    return HomeState(status: status);
  }

  @override
  HomeState copyWith({HomeStatus? homeStatus}) {
    return HomeState(status: homeStatus ?? status);
  }
}
