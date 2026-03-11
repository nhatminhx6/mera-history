import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/calendar_event_model.dart';
import 'package:mera_history/data/models/daily_advice.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/calendar/models/lunar_day_info.dart';
import 'package:mera_history/features/calendar/repository/calendar_repository.dart';

part 'calendar_bloc.freezed.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc(this._repository)
    : super(CalendarState.initial(DateTime.now())) {
    on<_Started>(_onStarted);
    on<_DaySelected>(_onDaySelected);
    on<_MonthChanged>(
      (event, emit) => emit(state.copyWith(focusedMonth: event.month)),
    );
  }

  final CalendarRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<CalendarState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final payload = await _repository.loadCalendarPayload();
      final selection = await _repository.loadDay(state.selectedDay);
      emit(
        state.copyWith(
          isLoading: false,
          markers: payload.markers,
          specialLunarDays: payload.specialLunarDays,
          selectedLunarInfo: selection.lunarInfo,
          selectedEvents: selection.events,
          selectedAdvice: selection.dailyAdvice,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onDaySelected(
    _DaySelected event,
    Emitter<CalendarState> emit,
  ) async {
    emit(state.copyWith(selectedDay: event.day, isLoading: true));
    try {
      final selection = await _repository.loadDay(event.day);
      emit(
        state.copyWith(
          isLoading: false,
          selectedLunarInfo: selection.lunarInfo,
          selectedEvents: selection.events,
          selectedAdvice: selection.dailyAdvice,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

@freezed
sealed class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.started() = _Started;
  const factory CalendarEvent.daySelected(DateTime day) = _DaySelected;
  const factory CalendarEvent.monthChanged(DateTime month) = _MonthChanged;
}

@freezed
sealed class CalendarState with _$CalendarState {
  const factory CalendarState({
    required DateTime focusedMonth,
    required DateTime selectedDay,
    required bool isLoading,
    required List<CalendarEventModel> markers,
    required Set<String> specialLunarDays,
    required List<HistoryEventModel> selectedEvents,
    LunarDayInfo? selectedLunarInfo,
    DailyAdvice? selectedAdvice,
    String? error,
  }) = _CalendarState;

  factory CalendarState.initial(DateTime now) => CalendarState(
    focusedMonth: now,
    selectedDay: now,
    isLoading: false,
    markers: const [],
    specialLunarDays: const {},
    selectedEvents: const [],
  );
}
