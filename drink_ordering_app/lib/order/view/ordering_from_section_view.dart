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
            children: [
              const Text('Ordering from:'),
              Text(company.name),
              Text(company.rating),
              Text(company.tags),
            ],
          );
        },
      ),
    );
  }
}
