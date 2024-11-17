import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<OrderCubit>().state.cart;
    Widget button = IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () => AppNavigator.goToOrderCartPage(context),
    );

    if (cart.entries.isNotEmpty) {
      button = Badge.count(
        count: cart.entries.length,
        backgroundColor: Colors.red,
        child: button,
      );
    }

    return button;
  }
}
