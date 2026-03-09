import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/history/models/history_models.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';

part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this._repository) : super(const HistoryState.initial()) {
    on<_FeedLoaded>(_onFeedLoaded);
    on<_QueryChanged>(_onQueryChanged);
    on<_FilterChanged>(_onFilterChanged);
    on<_DetailLoaded>(_onDetailLoaded);
  }

  final HistoryRepository _repository;

  Future<void> _onFeedLoaded(
    _FeedLoaded event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryState.loading());
    try {
      final allEvents = await _repository.getAllEvents();
      final filtered = HistoryRepositoryImpl.applyFilter(
        source: allEvents,
        filter: HistoryFilter.today,
        query: '',
      );
      emit(
        HistoryState.feed(
          allEvents: allEvents,
          filteredEvents: filtered,
          selectedFilter: HistoryFilter.today,
          query: '',
        ),
      );
    } catch (e) {
      emit(HistoryState.error(message: e.toString()));
    }
  }

  Future<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<HistoryState> emit,
  ) async {
    final current = state;
    if (current is! _Feed) return;
    final filtered = HistoryRepositoryImpl.applyFilter(
      source: current.allEvents,
      filter: current.selectedFilter,
      query: event.query,
    );
    emit(current.copyWith(query: event.query, filteredEvents: filtered));
  }

  Future<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<HistoryState> emit,
  ) async {
    final current = state;
    if (current is! _Feed) return;
    final filtered = HistoryRepositoryImpl.applyFilter(
      source: current.allEvents,
      filter: event.filter,
      query: current.query,
    );
    emit(
      current.copyWith(selectedFilter: event.filter, filteredEvents: filtered),
    );
  }

  Future<void> _onDetailLoaded(
    _DetailLoaded event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryState.loading());
    try {
      final selected = await _repository.getEventById(event.eventId);
      final all = await _repository.getAllEvents();
      final related = all.where((e) => e.id != event.eventId).take(3).toList();
      emit(
        HistoryState.detail(selectedEvent: selected, relatedEvents: related),
      );
    } catch (e) {
      emit(HistoryState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.feedLoaded() = _FeedLoaded;
  const factory HistoryEvent.queryChanged(String query) = _QueryChanged;
  const factory HistoryEvent.filterChanged(HistoryFilter filter) =
      _FilterChanged;
  const factory HistoryEvent.detailLoaded(String eventId) = _DetailLoaded;
}

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = _Initial;
  const factory HistoryState.loading() = _Loading;
  const factory HistoryState.feed({
    required List<HistoryEventModel> allEvents,
    required List<HistoryEventModel> filteredEvents,
    required HistoryFilter selectedFilter,
    required String query,
  }) = _Feed;
  const factory HistoryState.detail({
    required HistoryEventModel? selectedEvent,
    required List<HistoryEventModel> relatedEvents,
  }) = _Detail;
  const factory HistoryState.error({required String message}) = _Error;
}
