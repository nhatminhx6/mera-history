import 'package:flutter/material.dart';
import 'package:mera_history/data/models/hero_model.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, required this.hero, required this.onTap});

  final HeroModel hero;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(hero.image, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                hero.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
