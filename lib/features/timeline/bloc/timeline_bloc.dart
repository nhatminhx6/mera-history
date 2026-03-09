import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/timeline/repository/timeline_repository.dart';

part 'timeline_bloc.freezed.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc(this._repository) : super(const TimelineState.initial()) {
    on<_LoadTimeline>(_onLoadTimeline);
  }

  final TimelineRepository _repository;

  Future<void> _onLoadTimeline(
    _LoadTimeline event,
    Emitter<TimelineState> emit,
  ) async {
    emit(const TimelineState.loading());
    try {
      final timeline = await _repository.getTimeline();
      emit(TimelineState.loaded(events: timeline));
    } catch (e) {
      emit(TimelineState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent.loadTimeline() = _LoadTimeline;
}

@freezed
sealed class TimelineState with _$TimelineState {
  const factory TimelineState.initial() = _Initial;
  const factory TimelineState.loading() = _Loading;
  const factory TimelineState.loaded({
    required List<HistoryEventModel> events,
  }) = _Loaded;
  const factory TimelineState.error({required String message}) = _Error;
}
