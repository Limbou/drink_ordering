import 'package:drink_ordering_app/theme/app_colors.dart';
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
      backgroundColor: AppColors.white,
      textColor: AppColors.grey3333,
      count: badgeCount,
      padding: const EdgeInsets.all(4),
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
