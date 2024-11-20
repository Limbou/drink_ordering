import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showOrderSuccessfulDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: Text(Translations.of(context).order_confirmation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              AppNavigator.pop(context);
              context.read<OrderCubit>().clearOrder();
            },
            child: Text('OK', style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      );
    },
  );
}
