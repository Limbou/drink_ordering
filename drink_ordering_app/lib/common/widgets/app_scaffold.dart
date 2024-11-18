import 'package:drink_ordering_app/common/app_bar/index.dart';
import 'package:drink_ordering_app/common/widgets/gradient_image_background.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    this.background,
    this.appBar,
    this.gradientStartFraction = 0.45,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final Widget? background;
  final PreferredSizeWidget? appBar;
  final double gradientStartFraction;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? const CartAppBar(),
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          background ?? const SizedBox(),
          GradientBackground(
            gradientStartFraction: gradientStartFraction,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
