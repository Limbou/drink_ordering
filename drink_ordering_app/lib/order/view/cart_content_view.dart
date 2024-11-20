import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/order/view/cart_entry_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartContentView extends StatelessWidget {
  const CartContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translations.of(context).order_bag.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const CurrencySelector(),
              ],
            ),
          ),
        ),
        BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cart = state.cart;
            if (cart.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    Translations.of(context).order_cart_empty,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              );
            }

            return SliverList.builder(
              itemCount: cart.entries.length,
              itemBuilder: (context, index) {
                final entry = cart.entries[index];
                return CartEntryTile(cartEntry: entry);
              },
            );
          },
        ),
      ],
    );
  }
}
