import 'package:flutter/material.dart';

class ShineEffect extends StatefulWidget {
  final Widget child;

  const ShineEffect({super.key, required this.child});

  @override
  State<ShineEffect> createState() => _ShineEffectState();
}

class _ShineEffectState extends State<ShineEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder:
        (context, child) => ShaderMask(
          shaderCallback: (bounds) {
            final shimmerPosition = _controller.value * 2 - 1;
            return LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1 + shimmerPosition, 0),
              end: Alignment(1 + shimmerPosition, 0),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: widget.child,
        ),
  );
}
