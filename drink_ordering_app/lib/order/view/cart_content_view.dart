import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/order/view/cart_entry_tile.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartContentView extends StatelessWidget {
  const CartContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BAG',
                  style: TextStyle(
                    color: AppColors.grey9999,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CurrencySelector(),
              ],
            ),
          ),
        ),
        BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cart = state.cart;
            if (cart.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Cart is empty',
                    style: TextStyle(color: AppColors.whiteEEF1, fontSize: 24),
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
