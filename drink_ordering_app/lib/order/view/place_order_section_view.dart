import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
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
                    const Text(
                      'Total',
                      style: TextStyle(
                        color: AppColors.whiteEEF1,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, state) => Text(
                        state.order.totalPrice.displayable,
                        style: const TextStyle(
                          color: AppColors.whiteEEF1,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<OrderCubit>().placeOrder(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orangeFFAE,
                    foregroundColor: AppColors.whiteEEF1,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size.fromHeight(60),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Place Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
