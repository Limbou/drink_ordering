import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class RatingsAndTagsSectionView extends StatelessWidget {
  const RatingsAndTagsSectionView({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: Theme.of(context).colorScheme.onTertiary,
          size: 32,
        ),
        const SizedBox(width: 4),
        Text(
          company.rating,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
        ),
        const SizedBox(width: 4),
        Text(
          '(${company.numberOfRatings})',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: 8),
        Text(
          company.tags,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
