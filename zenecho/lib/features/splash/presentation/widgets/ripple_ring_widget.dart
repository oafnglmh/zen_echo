import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class RippleRingWidget extends StatefulWidget {
  const RippleRingWidget({
    super.key,
    required this.delay,
    required this.maxRadius,
    this.strokeWidth = 1.0,
    this.color = AppColors.ripple,
  });

  final Duration delay;
  final double maxRadius;
  final double strokeWidth;
  final Color color;

  @override
  State<RippleRingWidget> createState() => _RippleRingWidgetState();
}

class _RippleRingWidgetState extends State<RippleRingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _radius;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );
    _radius = Tween<double>(begin: 0.0, end: widget.maxRadius).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
    _opacity = Tween<double>(begin: 0.55, end: 0.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeIn),
    );
    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.repeat();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) => CustomPaint(
        painter: _RingPainter(
          radius: _radius.value,
          opacity: _opacity.value,
          color: widget.color,
          strokeWidth: widget.strokeWidth,
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.radius,
    required this.opacity,
    required this.color,
    required this.strokeWidth,
  });

  final double radius;
  final double opacity;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius <= 0) return;
    final paint = Paint()
      ..color = color.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.radius != radius || old.opacity != opacity;
}
