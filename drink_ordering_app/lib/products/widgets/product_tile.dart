import 'package:domain/domain.dart';
import 'package:drink_ordering_app/common/extensions/product_image_path_extension.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProductImage(product: product),
        const SizedBox(width: 16),
        Expanded(child: _ProductDetails(product: product)),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: _AddToCartButton(product: product),
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox.square(
        dimension: 82,
        child: Image.asset(
          product.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: const TextStyle(
            color: AppColors.whiteEEF1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.price.displayable,
          style: const TextStyle(
            color: AppColors.orangeFFCC,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              product.alcoholPercentage,
              style: const TextStyle(
                color: AppColors.whiteEEF1,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              product.volume,
              style: const TextStyle(
                color: AppColors.whiteEEF1,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<OrderCubit>().state.cart;
    final productQuantity = cart.getQuantity(product.id);

    return InkWell(
      onTap: () => context.read<OrderCubit>().addItem(product),
      child: Badge.count(
        backgroundColor: AppColors.white,
        textColor: AppColors.grey3333,
        padding: const EdgeInsets.all(4),
        offset: const Offset(-4, -2),
        count: productQuantity,
        isLabelVisible: productQuantity > 0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.grey5050, width: 1),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_rounded,
              color: AppColors.orangeFFAE,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
