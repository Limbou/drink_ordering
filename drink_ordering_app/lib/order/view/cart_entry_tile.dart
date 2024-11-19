import 'package:domain/domain.dart';
import 'package:drink_ordering_app/common/extensions/product_image_path_extension.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/order/widgets/quantity_selector.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartEntryTile extends StatelessWidget {
  const CartEntryTile({required this.cartEntry, super.key});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProductDetails(cartEntry: cartEntry),
        const SizedBox(height: 16),
        _QuantityAndPrice(cartEntry: cartEntry),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(
            color: AppColors.grey5050,
          ),
        ),
      ],
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.cartEntry});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProductImage(cartEntry: cartEntry),
        const SizedBox(width: 16),
        Expanded(child: _ProductInfo(cartEntry: cartEntry)),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
            alignment: Alignment.topCenter,
            child: _RemoveFromCartButton(cartEntry: cartEntry),
          ),
        ),
      ],
    );
  }
}

class _QuantityAndPrice extends StatelessWidget {
  const _QuantityAndPrice({required this.cartEntry});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuantitySelector(cartEntry: cartEntry),
          Text(
            cartEntry.totalPrice.displayable,
            style: const TextStyle(
              color: AppColors.orangeF5A6,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.cartEntry});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox.square(
        dimension: 45,
        child: Image.asset(
          cartEntry.product.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.cartEntry});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartEntry.product.name,
          style: const TextStyle(
            color: AppColors.whiteEEF1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              cartEntry.product.alcoholPercentage,
              style: const TextStyle(
                color: AppColors.whiteEEF1,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              cartEntry.product.volume,
              style: const TextStyle(
                color: AppColors.whiteEEF1,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RemoveFromCartButton extends StatelessWidget {
  const _RemoveFromCartButton({required this.cartEntry});

  final CartEntry cartEntry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<OrderCubit>().removeItem(cartEntry.product.id),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(45 / 360),
          child: Icon(
            Icons.add_rounded,
            color: AppColors.whiteEEF1,
          ),
        ),
      ),
    );
  }
}
