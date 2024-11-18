import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    required this.child,
    this.gradientStartFraction = 0.45,
    super.key,
  });

  final double gradientStartFraction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.greyMainGradient(gradientStartFraction),
      ),
      child: child,
    );
  }
}
