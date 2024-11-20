import 'package:domain/domain.dart';
import 'package:drink_ordering_app/common/app_bar/index.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({required this.cartEntry, super.key});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          backgroundColor: Colors.transparent,
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
          icon: Icon(
            Icons.remove_rounded,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onTap: () => context.read<OrderCubit>().decrementItem(cartEntry.product.id),
        ),
        const SizedBox(width: 16),
        Text(
          cartEntry.quantity.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        AppBarButton(
          backgroundColor: Colors.transparent,
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
          icon: Icon(
            Icons.add_rounded,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onTap: () => context.read<OrderCubit>().addItem(cartEntry.product),
        ),
      ],
    );
  }
}
