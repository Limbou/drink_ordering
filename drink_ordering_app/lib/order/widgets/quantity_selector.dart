import 'package:domain/domain.dart';
import 'package:drink_ordering_app/common/app_bar/index.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
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
          border: Border.all(color: AppColors.grey5050, width: 1),
          icon: const Icon(
            Icons.remove_rounded,
            color: AppColors.orangeF5A6,
          ),
          onTap: () => context.read<OrderCubit>().decrementItem(cartEntry.product.id),
        ),
        const SizedBox(width: 16),
        Text(
          cartEntry.quantity.toString(),
          style: const TextStyle(
            color: AppColors.whiteEEF1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        AppBarButton(
          backgroundColor: Colors.transparent,
          border: Border.all(color: AppColors.grey5050, width: 1),
          icon: const Icon(
            Icons.add_rounded,
            color: AppColors.orangeF5A6,
          ),
          onTap: () => context.read<OrderCubit>().addItem(cartEntry.product),
        ),
      ],
    );
  }
}
