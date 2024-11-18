import 'package:drink_ordering_app/order/cubit/index.dart';
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
          padding: EdgeInsets.only(bottom: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'BAG',
              style: TextStyle(
                color: AppColors.grey9999,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cart = state.cart;
            if (cart.isEmpty) return const Center(child: Text('Cart is empty'));

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
