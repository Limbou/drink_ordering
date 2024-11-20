import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.watch<OrderCubit>();
    final currencies = orderCubit.state.exchangeRates?.keys ?? [];
    if (currencies.isEmpty) return const SizedBox();

    return DropdownButton(
      value: orderCubit.state.order.totalPrice.currency,
      items: currencies.map((currency) => DropdownMenuItem(value: currency, child: Text(currency.symbol))).toList(),
      onChanged: (currency) => currency != null ? orderCubit.changeCurrency(currency) : null,
      style: Theme.of(context).textTheme.bodyMedium,
      dropdownColor: Theme.of(context).colorScheme.primary,
    );
  }
}
