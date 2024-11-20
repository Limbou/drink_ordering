import 'package:domain/domain.dart';

final class PurchaseOrder {
  final Cart cart;
  final Company? company;
  final Tip? tip;

  const PurchaseOrder({
    required this.cart,
    this.company,
    this.tip,
  });

  const PurchaseOrder.empty()
      : cart = const Cart.empty(),
        company = null,
        tip = null;

  Money get totalPrice => cart.total + (cart.total.fraction(tip?.value ?? 0.0));

  Currency get currency => cart.currency;

  PurchaseOrder withNewCurrency(Currency currency, Map<Currency, double> exchangeRates) {
    return PurchaseOrder(
      cart: cart.withNewCurrency(currency, exchangeRates),
      company: company,
      tip: tip,
    );
  }

  PurchaseOrder copyWith({
    Cart? cart,
    Company? company,
    Tip? Function()? tip,
  }) {
    return PurchaseOrder(
      cart: cart ?? this.cart,
      company: company ?? this.company,
      tip: tip?.call() ?? this.tip,
    );
  }
}
