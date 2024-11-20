import 'dart:math';

import 'package:flutter/material.dart';

class OrderPageTransition extends StatefulWidget {
  const OrderPageTransition({required this.animation, required this.child, super.key});

  final Animation<double> animation;
  final Widget child;

  @override
  State<OrderPageTransition> createState() => _OrderPageTransitionState();
}

class _OrderPageTransitionState extends State<OrderPageTransition> {
  bool _showTargetPage = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final diagonal = sqrt(screenSize.width * screenSize.width + screenSize.height * screenSize.height);
    return Stack(
      children: [
        if (_showTargetPage) widget.child,
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 34, right: 42),
              child: _AnimatedRingWidget(
                animation: widget.animation,
                innerRadius: 0,
                outerRadius: diagonal,
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                onFirstPartComplete: () => setState(() {
                  _showTargetPage = true;
                }),
                onFirstPartReverseComplete: () => setState(() {
                  _showTargetPage = false;
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedRingWidget extends StatelessWidget {
  final Animation<double> animation;
  final double innerRadius;
  final double outerRadius;
  final Color color;
  final VoidCallback onFirstPartComplete;
  final VoidCallback onFirstPartReverseComplete;

  const _AnimatedRingWidget({
    required this.animation,
    required this.innerRadius,
    required this.outerRadius,
    required this.onFirstPartComplete,
    required this.onFirstPartReverseComplete,
    this.color = Colors.blue,
  }) : assert(outerRadius > innerRadius, 'Outer radius must be greater than inner radius');

  @override
  Widget build(BuildContext context) {
    final outerRadiusAnimation = animation.drive(
      Tween<double>(begin: innerRadius, end: outerRadius).chain(
        CurveTween(curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)),
      ),
    )..addListener(() {
        if (animation.value >= 0.5 && animation.status == AnimationStatus.forward) {
          onFirstPartComplete();
        } else if (animation.value <= 0.5 && animation.status == AnimationStatus.reverse) {
          onFirstPartReverseComplete();
        }
      });

    final innerRadiusAnimation = animation.drive(
      Tween<double>(begin: innerRadius, end: outerRadius).chain(
        CurveTween(curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)),
      ),
    );

    final opacityAnimation = animation.drive(
      Tween<double>(begin: 0, end: 1).chain(
        CurveTween(curve: const Interval(0, 0.25, curve: Curves.easeInOut)),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _RingPainter(
            innerRadius: innerRadiusAnimation.value,
            outerRadius: outerRadiusAnimation.value,
            color: color,
            opacity: opacityAnimation.value,
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  final double innerRadius;
  final double outerRadius;
  final Color color;
  final double opacity;

  _RingPainter({
    required this.innerRadius,
    required this.outerRadius,
    required this.color,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const center = Offset.zero;
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    final path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: outerRadius))
      ..addOval(Rect.fromCircle(center: center, radius: innerRadius))
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.innerRadius != innerRadius ||
        oldDelegate.outerRadius != outerRadius ||
        oldDelegate.color != color;
  }
}
