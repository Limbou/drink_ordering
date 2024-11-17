import 'package:domain/domain.dart';

final class PurchaseOrder {
  final Cart cart;
  final Company? company;
  final Money? tip;

  const PurchaseOrder({
    required this.cart,
    this.company,
    this.tip,
  });

  const PurchaseOrder.empty()
      : cart = const Cart.empty(),
        company = null,
        tip = null;

  Money get totalPrice => cart.total + tip;

  PurchaseOrder copyWith({
    Cart? cart,
    Company? company,
    Money? Function()? tip,
  }) {
    return PurchaseOrder(
      cart: cart ?? this.cart,
      company: company ?? this.company,
      tip: tip?.call() ?? this.tip,
    );
  }
}
