import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderSectionView extends StatelessWidget {
  const PlaceOrderSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Translations.of(context).order_cart_total,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, state) => Text(
                        state.order.totalPrice.displayable,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) => ElevatedButton(
                    onPressed: state.cart.isEmpty ? null : () => context.read<OrderCubit>().placeOrder(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSecondaryFixed,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      disabledBackgroundColor: Theme.of(context).colorScheme.primary,
                      disabledForegroundColor: Theme.of(context).colorScheme.surface,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(60),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: state is OrderStateOrdering
                        ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : Text(Translations.of(context).order_place_order),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
