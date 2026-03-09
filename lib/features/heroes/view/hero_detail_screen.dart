import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/features/heroes/bloc/heroes_bloc.dart';
import 'package:mera_history/shared/widgets/app_error.dart';
import 'package:mera_history/shared/widgets/app_loading.dart';

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key, required this.heroId});

  final int heroId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HeroDetailScreen')),
      body: BlocBuilder<HeroesBloc, HeroesState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<HeroesBloc>().add(
                HeroesEvent.loadHeroDetail(heroId),
              );
              return const AppLoading();
            },
            loading: AppLoading.new,
            error: (message) => AppError(message: message),
            loaded: (heroes, selectedHero, relatedEvents) {
              if (selectedHero == null) {
                return const AppError(message: 'Hero not found');
              }
              return ListView(
                children: [
                  Image.network(
                    selectedHero.image,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      selectedHero.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${selectedHero.born} - ${selectedHero.died}\n\n${selectedHero.description}',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Related events'),
                  ),
                  ...relatedEvents.map(
                    (event) => ListTile(
                      title: Text(event.title),
                      subtitle: Text('${event.year}'),
                      onTap: () => context.push('/history/detail/${event.id}'),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
