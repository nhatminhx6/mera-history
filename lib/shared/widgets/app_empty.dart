import 'package:flutter/material.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
