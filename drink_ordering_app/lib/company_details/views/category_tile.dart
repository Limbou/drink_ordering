import 'package:domain/domain.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category, required this.onTap, super.key});

  final ProductCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: AppColors.grey5050,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                IconData(category.iconData, fontFamily: 'MaterialIcons'),
                color: AppColors.whiteEEF1,
              ),
              const SizedBox(height: 16),
              Text(
                category.name,
                style: const TextStyle(color: AppColors.whiteEEF1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
