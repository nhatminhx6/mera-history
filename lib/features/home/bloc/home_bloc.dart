import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/features/home/models/home_models.dart';
import 'package:mera_history/features/home/repository/home_repository.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(const HomeState.initial()) {
    on<_Started>(_onStarted);
  }

  final HomeRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    try {
      final dashboard = await _repository.loadDashboard();
      emit(HomeState.loaded(dashboard: dashboard));
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
}

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({required HomeDashboardModel dashboard}) =
      _Loaded;
  const factory HomeState.error({required String message}) = _Error;
}
