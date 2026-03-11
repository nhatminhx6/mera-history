import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/features/profile/models/profile_models.dart';
import 'package:mera_history/features/profile/repository/profile_repository.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repository) : super(const ProfileState.initial()) {
    on<_Started>(_onStarted);
  }

  final ProfileRepository _repository;

  Future<void> _onStarted(_Started event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final overview = await _repository.loadProfile();
      emit(ProfileState.loaded(overview: overview));
    } catch (e) {
      emit(ProfileState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
}

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded({required ProfileOverviewModel overview}) =
      _Loaded;
  const factory ProfileState.error({required String message}) = _Error;
}
