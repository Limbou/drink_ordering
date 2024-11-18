import 'package:drink_ordering_app/company_details/views/company_ratings_and_tags_section_view.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderingFromSectionView extends StatelessWidget {
  const OrderingFromSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final company = state.company;
          if (company == null) return const SizedBox();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ORDERING FROM',
                style: TextStyle(
                  color: AppColors.grey9999,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                company.name,
                style: const TextStyle(
                  color: AppColors.whiteEEF1,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              RatingsAndTagsSectionView(company: company),
              const SizedBox(height: 8),
              const _EstimatedCompletionTime(),
            ],
          );
        },
      ),
    );
  }
}

class _EstimatedCompletionTime extends StatelessWidget {
  const _EstimatedCompletionTime({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.select((OrderCubit cubit) => cubit.state.cart);
    final estimatedCompletionTime = cart.estimatedCompletionTime;
    if (estimatedCompletionTime == null) return const SizedBox();

    return Text(
      'Estimated completion time: ${estimatedCompletionTime.inMinutes} min',
      style: const TextStyle(
        color: AppColors.whiteEEF1,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
