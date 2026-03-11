import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';

part 'explore_bloc.freezed.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(this._repository) : super(const ExploreState.initial()) {
    on<_Started>(_onStarted);
    on<_QueryChanged>(_onQueryChanged);
    on<_FilterChanged>(_onFilterChanged);
    on<_FigureRoleChanged>(_onFigureRoleChanged);
  }

  final ExploreRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<ExploreState> emit) async {
    emit(const ExploreState.loading());
    try {
      final hub = await _repository.loadHub();
      emit(
        ExploreState.loaded(
          hub: hub,
          query: '',
          selectedFilter: '',
          selectedFigureRole: '',
        ),
      );
    } catch (e) {
      emit(ExploreState.error(message: e.toString()));
    }
  }

  void _onQueryChanged(_QueryChanged event, Emitter<ExploreState> emit) {
    final current = state;
    if (current is! _Loaded) return;
    emit(current.copyWith(query: event.query));
  }

  void _onFilterChanged(_FilterChanged event, Emitter<ExploreState> emit) {
    final current = state;
    if (current is! _Loaded) return;
    emit(
      current.copyWith(
        selectedFilter: current.selectedFilter == event.filter
            ? ''
            : event.filter,
      ),
    );
  }

  void _onFigureRoleChanged(
    _FigureRoleChanged event,
    Emitter<ExploreState> emit,
  ) {
    final current = state;
    if (current is! _Loaded) return;
    emit(
      current.copyWith(
        selectedFigureRole: current.selectedFigureRole == event.role
            ? ''
            : event.role,
      ),
    );
  }
}

@freezed
sealed class ExploreEvent with _$ExploreEvent {
  const factory ExploreEvent.started() = _Started;
  const factory ExploreEvent.queryChanged(String query) = _QueryChanged;
  const factory ExploreEvent.filterChanged(String filter) = _FilterChanged;
  const factory ExploreEvent.figureRoleChanged(String role) =
      _FigureRoleChanged;
}

@freezed
sealed class ExploreState with _$ExploreState {
  const factory ExploreState.initial() = _Initial;
  const factory ExploreState.loading() = _Loading;
  const factory ExploreState.loaded({
    required ExploreHubData hub,
    required String query,
    required String selectedFilter,
    required String selectedFigureRole,
  }) = _Loaded;
  const factory ExploreState.error({required String message}) = _Error;
}
