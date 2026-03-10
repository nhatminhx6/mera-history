import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class DynastyChipList extends StatelessWidget {
  const DynastyChipList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: spacing.xs),
        itemBuilder: (context, index) => Chip(label: Text(items[index])),
      ),
    );
  }
}
