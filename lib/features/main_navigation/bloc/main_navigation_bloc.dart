import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_navigation_bloc.freezed.dart';

class MainNavigationBloc
    extends Bloc<MainNavigationEvent, MainNavigationState> {
  MainNavigationBloc() : super(const MainNavigationState(index: 0)) {
    on<_TabSelected>((event, emit) => emit(state.copyWith(index: event.index)));
  }
}

@freezed
sealed class MainNavigationEvent with _$MainNavigationEvent {
  const factory MainNavigationEvent.tabSelected(int index) = _TabSelected;
}

@freezed
sealed class MainNavigationState with _$MainNavigationState {
  const factory MainNavigationState({required int index}) =
      _MainNavigationState;
}
