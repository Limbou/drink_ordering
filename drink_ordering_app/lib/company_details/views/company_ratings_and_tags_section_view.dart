import 'package:domain/domain.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RatingsAndTagsSectionView extends StatelessWidget {
  const RatingsAndTagsSectionView({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: AppColors.orangeFFCC,
          size: 32,
        ),
        const SizedBox(width: 4),
        Text(
          company.rating,
          style: const TextStyle(
            color: AppColors.orangeFFCC,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(${company.numberOfRatings})',
          style: const TextStyle(
            color: AppColors.grey9999,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          company.tags,
          style: const TextStyle(
            color: AppColors.whiteEEF1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
