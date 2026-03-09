import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/figures/models/figures_models.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';

part 'figures_bloc.freezed.dart';

class FiguresBloc extends Bloc<FiguresEvent, FiguresState> {
  FiguresBloc(this._repository) : super(const FiguresState.initial()) {
    on<_FeedLoaded>(_onFeedLoaded);
    on<_QueryChanged>(_onQueryChanged);
    on<_FilterChanged>(_onFilterChanged);
    on<_DetailLoaded>(_onDetailLoaded);
  }

  final FiguresRepository _repository;

  Future<void> _onFeedLoaded(
    _FeedLoaded event,
    Emitter<FiguresState> emit,
  ) async {
    emit(const FiguresState.loading());
    try {
      final allFigures = await _repository.getAllFigures();
      final filtered = FiguresRepositoryImpl.applyFilter(
        source: allFigures,
        filter: FigureFilter.generals,
        query: '',
      );
      emit(
        FiguresState.feed(
          allFigures: allFigures,
          filteredFigures: filtered,
          selectedFilter: FigureFilter.generals,
          query: '',
        ),
      );
    } catch (e) {
      emit(FiguresState.error(message: e.toString()));
    }
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<FiguresState> emit,
  ) async {
    final current = state;
    if (current is! _Feed) return;
    final filtered = FiguresRepositoryImpl.applyFilter(
      source: current.allFigures,
      filter: current.selectedFilter,
      query: event.query,
    );
    emit(current.copyWith(query: event.query, filteredFigures: filtered));
  }

  Future<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<FiguresState> emit,
  ) async {
    final current = state;
    if (current is! _Feed) return;
    final filtered = FiguresRepositoryImpl.applyFilter(
      source: current.allFigures,
      filter: event.filter,
      query: current.query,
    );
    emit(
      current.copyWith(selectedFilter: event.filter, filteredFigures: filtered),
    );
  }

  Future<void> _onDetailLoaded(
    _DetailLoaded event,
    Emitter<FiguresState> emit,
  ) async {
    emit(const FiguresState.loading());
    try {
      final selected = await _repository.getFigureById(event.figureId);
      final related = await _repository.getRelatedEvents(event.figureId);
      emit(
        FiguresState.detail(selectedFigure: selected, relatedEvents: related),
      );
    } catch (e) {
      emit(FiguresState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class FiguresEvent with _$FiguresEvent {
  const factory FiguresEvent.feedLoaded() = _FeedLoaded;
  const factory FiguresEvent.queryChanged(String query) = _QueryChanged;
  const factory FiguresEvent.filterChanged(FigureFilter filter) =
      _FilterChanged;
  const factory FiguresEvent.detailLoaded(int figureId) = _DetailLoaded;
}

@freezed
sealed class FiguresState with _$FiguresState {
  const factory FiguresState.initial() = _Initial;
  const factory FiguresState.loading() = _Loading;
  const factory FiguresState.feed({
    required List<HeroModel> allFigures,
    required List<HeroModel> filteredFigures,
    required FigureFilter selectedFilter,
    required String query,
  }) = _Feed;
  const factory FiguresState.detail({
    required HeroModel? selectedFigure,
    required List<HistoryEventModel> relatedEvents,
  }) = _Detail;
  const factory FiguresState.error({required String message}) = _Error;
}
