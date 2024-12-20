import 'package:drink_ordering_app/routing/router.dart';
import 'package:flutter/cupertino.dart';

final class AppNavigator {
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void goToProductsPage(
    BuildContext context, {
    required String companyName,
    required String categoryName,
  }) {
    ProductsRoute(companyName: companyName, categoryName: categoryName).push(context);
  }

  static void goToOrderCartPage(BuildContext context) {
    const OrderRoute().push(context);
  }
}
