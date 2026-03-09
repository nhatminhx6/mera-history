import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/features/heroes/bloc/heroes_bloc.dart';
import 'package:mera_history/shared/components/hero_card.dart';
import 'package:mera_history/shared/widgets/app_empty.dart';
import 'package:mera_history/shared/widgets/app_error.dart';
import 'package:mera_history/shared/widgets/app_loading.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HeroesScreen')),
      body: BlocBuilder<HeroesBloc, HeroesState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<HeroesBloc>().add(const HeroesEvent.loadHeroes());
              return const AppLoading();
            },
            loading: AppLoading.new,
            error: (message) => AppError(message: message),
            loaded: (heroes, selectedHero, relatedEvents) {
              if (heroes.isEmpty) {
                return const AppEmpty(message: 'No historical heroes found');
              }
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                ),
                itemCount: heroes.length,
                itemBuilder: (context, index) {
                  final hero = heroes[index];
                  return HeroCard(
                    hero: hero,
                    onTap: () => context.push('/heroes/${hero.id}'),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
