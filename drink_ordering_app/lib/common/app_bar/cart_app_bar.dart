import 'package:drink_ordering_app/common/app_bar/app_bar_button.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({this.title, super.key});

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final parentRoute = ModalRoute.of(context);
    final showBackButton = parentRoute?.impliesAppBarDismissal ?? false;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            if (showBackButton)
              AppBarButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onTap: () => AppNavigator.pop(context),
              ),
            Expanded(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            AppBarButton(
              backgroundColor: Theme.of(context).colorScheme.onSecondaryFixed,
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onTap: () => AppNavigator.goToOrderCartPage(context),
              badgeCount: context.select<OrderCubit, int>((cubit) => cubit.state.cart.entries.length),
            ),
          ],
        ),
      ),
    );
  }
}
