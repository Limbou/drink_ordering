import 'package:drink_ordering_app/company_details/views/company_ratings_and_tags_section_view.dart';
import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
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
              Text(
                Translations.of(context).order_ordering_from.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 16),
              Text(
                company.name,
                style: Theme.of(context).textTheme.displayLarge,
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
  const _EstimatedCompletionTime();

  @override
  Widget build(BuildContext context) {
    final cart = context.select((OrderCubit cubit) => cubit.state.cart);
    final estimatedCompletionTime = cart.estimatedCompletionTime;
    if (estimatedCompletionTime == null) return const SizedBox();

    return Text(
      Translations.of(context).order_estimated_completion_time('${estimatedCompletionTime.inMinutes} min'),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
