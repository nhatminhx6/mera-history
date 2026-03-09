import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/saved/models/saved_models.dart';
import 'package:mera_history/features/saved/repository/saved_repository.dart';

part 'saved_bloc.freezed.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc(this._repository) : super(const SavedState.initial()) {
    on<_Started>(_onStarted);
  }

  final SavedRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<SavedState> emit) async {
    emit(const SavedState.loading());
    try {
      final events = await _repository.savedEvents();
      final figures = await _repository.savedFigures();
      final reading = await _repository.readingHistory();
      emit(
        SavedState.loaded(
          events: events,
          figures: figures,
          readingHistory: reading,
        ),
      );
    } catch (e) {
      emit(SavedState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class SavedEvent with _$SavedEvent {
  const factory SavedEvent.started() = _Started;
}

@freezed
sealed class SavedState with _$SavedState {
  const factory SavedState.initial() = _Initial;
  const factory SavedState.loading() = _Loading;
  const factory SavedState.loaded({
    required List<HistoryEventModel> events,
    required List<HeroModel> figures,
    required List<ReadingHistoryItem> readingHistory,
  }) = _Loaded;
  const factory SavedState.error({required String message}) = _Error;
}
