import 'package:drink_ordering_app/common/app_bar/app_bar_button.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyOrderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'My order',
                style: TextStyle(fontSize: 38, color: AppColors.whiteEEF1),
              ),
            ),
            AppBarButton(
              backgroundColor: Colors.transparent,
              border: Border.all(color: AppColors.grey5050, width: 1),
              icon: const RotationTransition(
                turns: AlwaysStoppedAnimation(45 / 360),
                child: Icon(
                  Icons.add_rounded,
                  color: AppColors.orangeF5A6,
                ),
              ),
              onTap: () => AppNavigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
