import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    this.badgeCount,
    this.border,
  });

  final Color backgroundColor;
  final Border? border;
  final Widget icon;
  final VoidCallback onTap;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final badgeCount = this.badgeCount ?? 0;

    return Badge.count(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      textStyle: Theme.of(context).textTheme.titleSmall,
      padding: const EdgeInsets.all(4),
      count: badgeCount,
      offset: const Offset(-4, -2),
      isLabelVisible: badgeCount > 0,
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: border,
            ),
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }
}
