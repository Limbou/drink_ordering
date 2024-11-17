import 'package:domain/domain.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      trailing: _AddToCartButton(product: product),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<OrderCubit>().state.cart;
    Widget button = IconButton(
      onPressed: () => context.read<OrderCubit>().addItem(product),
      icon: const Icon(Icons.add),
    );

    final productQuantity = cart.getQuantity(product.id);
    if (productQuantity > 0) {
      button = Badge.count(
        count: productQuantity,
        backgroundColor: Colors.red,
        child: button,
      );
    }

    return button;
  }
}
