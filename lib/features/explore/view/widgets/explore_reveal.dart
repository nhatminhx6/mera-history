import 'dart:async';

import 'package:flutter/material.dart';

class ExploreReveal extends StatefulWidget {
  const ExploreReveal({
    super.key,
    required this.child,
    required this.delayMs,
    this.durationMs = 420,
    this.offsetY = 14,
  });

  final Widget child;
  final int delayMs;
  final int durationMs;
  final double offsetY;

  @override
  State<ExploreReveal> createState() => _ExploreRevealState();
}

class _ExploreRevealState extends State<ExploreReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _translateY;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMs),
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _translateY = Tween<double>(
      begin: widget.offsetY,
      end: 0,
    ).animate(_opacity);
    _timer = Timer(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, _translateY.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
