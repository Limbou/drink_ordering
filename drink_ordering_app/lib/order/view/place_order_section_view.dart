import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderSectionView extends StatelessWidget {
  const PlaceOrderSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) => Text('Total: ${state.order.totalPrice.displayable}'),
            ),
            ElevatedButton(
              onPressed: () => context.read<OrderCubit>().placeOrder(),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
