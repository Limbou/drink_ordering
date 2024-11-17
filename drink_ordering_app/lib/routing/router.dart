import 'package:drink_ordering_app/company_details/company_details_page.dart';
import 'package:drink_ordering_app/order/order_page.dart';
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
    required this.companyId,
    required this.categoryId,
  });

  final String companyId;
  final String categoryId;

  @override
  Widget build(BuildContext context, GoRouterState state) => ProductsPage(
        companyId: companyId,
        categoryId: categoryId,
      );
}

@TypedGoRoute<OrderRoute>(path: '/order')
final class OrderRoute extends GoRouteData {
  const OrderRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const OrderPage();
}
