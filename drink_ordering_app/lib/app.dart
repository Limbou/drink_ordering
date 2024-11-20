import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/order/cubit/order_cubit.dart';
import 'package:drink_ordering_app/routing/router.dart';
import 'package:drink_ordering_app/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<OrderCubit>()..init()),
      ],
      child: MaterialApp.router(
        title: 'Drink Ordering',
        theme: mainThemeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: appRouter,
      ),
    );
  }
}
