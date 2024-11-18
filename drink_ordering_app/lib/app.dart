import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/order/cubit/order_cubit.dart';
import 'package:drink_ordering_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<OrderCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Drink Ordering',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
