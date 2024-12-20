import 'package:drink_ordering_app/company_details/company_details_page.dart';
import 'package:drink_ordering_app/order/order_page.dart';
import 'package:drink_ordering_app/order/order_page_transition.dart';
import 'package:drink_ordering_app/products/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
);

@TypedGoRoute<CompanyDetailsRoute>(path: '/', routes: [
  TypedGoRoute<ProductsRoute>(
    path: 'products',
  )
])
final class CompanyDetailsRoute extends GoRouteData {
  const CompanyDetailsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CompanyDetailsPage();
}

final class ProductsRoute extends GoRouteData {
  const ProductsRoute({
    required this.companyName,
    required this.categoryName,
  });

  final String companyName;
  final String categoryName;

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductsPage(
        companyName: companyName,
        categoryName: categoryName,
      );
}

@TypedGoRoute<OrderRoute>(path: '/order')
final class OrderRoute extends GoRouteData {
  const OrderRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 700),
      child: const OrderPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return OrderPageTransition(animation: animation, child: child);
      },
    );
  }
}
