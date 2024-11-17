import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartContentView extends StatelessWidget {
  const CartContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(
          child: Text('Bag'),
        ),
        BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cart = state.cart;
            if (cart.isEmpty) return const Center(child: Text('Cart is empty'));

            return SliverList.separated(
              itemCount: cart.entries.length,
              itemBuilder: (context, index) {
                final entry = cart.entries[index];
                return ListTile(
                  title: Text(entry.product.name),
                  subtitle: Column(
                    children: [
                      Text(entry.totalPrice.displayable),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.read<OrderCubit>().decrementItem(entry.product.id),
                            icon: const Icon(Icons.remove),
                          ),
                          Text(entry.quantity.toString()),
                          IconButton(
                            onPressed: () => context.read<OrderCubit>().addItem(entry.product),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () => context.read<OrderCubit>().removeItem(entry.product.id),
                    icon: const Icon(Icons.remove),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ],
    );
  }
}
