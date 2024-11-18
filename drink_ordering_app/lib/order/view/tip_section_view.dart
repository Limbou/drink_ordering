import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TipSectionView extends StatelessWidget {
  const TipSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.grey5050, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (_) {},
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Leave a tip',
                    style: TextStyle(
                      color: AppColors.whiteEEF1,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
