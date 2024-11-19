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
    this.title,
    super.key,
  });

  final Widget body;
  final Widget? background;
  final PreferredSizeWidget? appBar;
  final double gradientStartFraction;
  final Color? backgroundColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? CartAppBar(title: title),
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
