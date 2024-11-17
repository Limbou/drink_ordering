// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $companyDetailsRoute,
      $orderRoute,
    ];

RouteBase get $companyDetailsRoute => GoRouteData.$route(
      path: '/',
      factory: $CompanyDetailsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'products',
          factory: $ProductsRouteExtension._fromState,
        ),
      ],
    );

extension $CompanyDetailsRouteExtension on CompanyDetailsRoute {
  static CompanyDetailsRoute _fromState(GoRouterState state) =>
      const CompanyDetailsRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductsRouteExtension on ProductsRoute {
  static ProductsRoute _fromState(GoRouterState state) => ProductsRoute(
        companyId: state.uri.queryParameters['company-id']!,
        categoryId: state.uri.queryParameters['category-id']!,
      );

  String get location => GoRouteData.$location(
        '/products',
        queryParams: {
          'company-id': companyId,
          'category-id': categoryId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $orderRoute => GoRouteData.$route(
      path: '/order',
      factory: $OrderRouteExtension._fromState,
    );

extension $OrderRouteExtension on OrderRoute {
  static OrderRoute _fromState(GoRouterState state) => const OrderRoute();

  String get location => GoRouteData.$location(
        '/order',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
