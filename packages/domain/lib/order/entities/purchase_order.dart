import 'package:domain/domain.dart';

final class PurchaseOrder {
  final Company company;
  final Cart cart;
  final Money? tip;

  const PurchaseOrder({
    required this.company,
    required this.cart,
    this.tip,
  });

  Money get totalPrice => cart.total + tip;

  PurchaseOrder addTip(Money tip) {
    return PurchaseOrder(
      company: company,
      cart: cart,
      tip: tip,
    );
  }

  PurchaseOrder cancelTip() {
    return PurchaseOrder(
      company: company,
      cart: cart,
      tip: null,
    );
  }
}
