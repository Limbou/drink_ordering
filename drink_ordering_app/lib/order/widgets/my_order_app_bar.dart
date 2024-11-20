import 'package:drink_ordering_app/common/app_bar/app_bar_button.dart';
import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
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
            Expanded(
              child: Text(
                Translations.of(context).order_title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            AppBarButton(
              backgroundColor: Colors.transparent,
              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
              icon: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Icon(
                  Icons.add_rounded,
                  color: Theme.of(context).colorScheme.onSecondary,
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
