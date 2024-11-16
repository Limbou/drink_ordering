import 'package:domain/domain.dart';

final class Order {
  final Company company;
  final Cart cart;
  final Money? tip;

  const Order({
    required this.company,
    required this.cart,
    this.tip,
  });

  Money get totalPrice => cart.total + tip;

  Order addTip(Money tip) {
    return Order(
      company: company,
      cart: cart,
      tip: tip,
    );
  }

  Order cancelTip() {
    return Order(
      company: company,
      cart: cart,
      tip: null,
    );
  }
}
