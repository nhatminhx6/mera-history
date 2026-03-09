import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/heroes/repository/heroes_repository.dart';

part 'heroes_bloc.freezed.dart';

class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  HeroesBloc(this._repository) : super(const HeroesState.initial()) {
    on<_LoadHeroes>(_onLoadHeroes);
    on<_LoadHeroDetail>(_onLoadHeroDetail);
  }

  final HeroesRepository _repository;

  Future<void> _onLoadHeroes(
    _LoadHeroes event,
    Emitter<HeroesState> emit,
  ) async {
    emit(const HeroesState.loading());
    try {
      final heroes = await _repository.getHeroes();
      emit(HeroesState.loaded(heroes: heroes));
    } catch (e) {
      emit(HeroesState.error(message: e.toString()));
    }
  }

  Future<void> _onLoadHeroDetail(
    _LoadHeroDetail event,
    Emitter<HeroesState> emit,
  ) async {
    emit(const HeroesState.loading());
    try {
      final hero = await _repository.getHeroById(event.heroId);
      final relatedEvents = await _repository.getRelatedEvents(event.heroId);
      emit(
        HeroesState.loaded(
          heroes: const [],
          selectedHero: hero,
          relatedEvents: relatedEvents,
        ),
      );
    } catch (e) {
      emit(HeroesState.error(message: e.toString()));
    }
  }
}

@freezed
sealed class HeroesEvent with _$HeroesEvent {
  const factory HeroesEvent.loadHeroes() = _LoadHeroes;
  const factory HeroesEvent.loadHeroDetail(int heroId) = _LoadHeroDetail;
}

@freezed
sealed class HeroesState with _$HeroesState {
  const factory HeroesState.initial() = _Initial;
  const factory HeroesState.loading() = _Loading;
  const factory HeroesState.loaded({
    required List<HeroModel> heroes,
    HeroModel? selectedHero,
    @Default([]) List<HistoryEventModel> relatedEvents,
  }) = _Loaded;
  const factory HeroesState.error({required String message}) = _Error;
}
