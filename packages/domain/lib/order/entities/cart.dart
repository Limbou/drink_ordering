import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

final class Cart extends Equatable {
  final Map<String, CartEntry> _entriesMap;
  final Currency currency;

  const Cart._(this._entriesMap, this.currency);

  const Cart.empty()
      : _entriesMap = const {},
        currency = const CurrencyUsd();

  @override
  List<Object> get props => [_entriesMap];

  List<CartEntry> get entries => _entriesMap.values.toList();

  bool get isEmpty => _entriesMap.isEmpty;

  Money get total {
    if (_entriesMap.isEmpty) {
      return Money.fromDouble(amount: 0, currency: currency);
    }
    return entries.fold(
      Money.fromDouble(amount: 0, currency: currency),
      (total, entry) => total + entry.totalPrice,
    );
  }

  Duration? get estimatedCompletionTime => entries.isEmpty ? null : Duration(minutes: entries.length * 5);

  Cart addProduct(Product product) {
    final entries = Map<String, CartEntry>.from(_entriesMap);
    entries.update(product.id, (entry) => entry.increment(), ifAbsent: () => CartEntry.newEntry(product: product));
    return Cart._(entries, currency);
  }

  Cart removeSingleProduct(String productId) {
    final entries = Map<String, CartEntry>.from(_entriesMap);
    final entry = entries[productId];
    if (entry == null) {
      return this;
    }
    if (entry.quantity == 1) {
      entries.remove(productId);
    } else {
      entries[productId] = entry.decrement();
    }
    return Cart._(entries, currency);
  }

  Cart removeProduct(String productId) {
    final entries = Map<String, CartEntry>.from(_entriesMap);
    entries.remove(productId);
    return Cart._(entries, currency);
  }

  int getQuantity(String productId) {
    final entry = _entriesMap[productId];
    return entry?.quantity ?? 0;
  }

  Cart withNewCurrency(Currency currency, Map<Currency, double> exchangeRates) {
    final entries = _entriesMap.map((key, value) => MapEntry(key, value.withNewCurrency(currency, exchangeRates)));
    return Cart._(entries, currency);
  }
}

final class CartEntry extends Equatable {
  final Product product;
  final int quantity;

  const CartEntry._({
    required this.product,
    required this.quantity,
  });

  const CartEntry.newEntry({required this.product}) : quantity = 1;

  CartEntry increment() {
    return CartEntry._(product: product, quantity: quantity + 1);
  }

  CartEntry decrement() {
    return CartEntry._(product: product, quantity: quantity - 1);
  }

  CartEntry withNewCurrency(Currency currency, Map<Currency, double> exchangeRates) {
    return CartEntry._(product: product.withNewCurrency(currency, exchangeRates), quantity: quantity);
  }

  Money get totalPrice => product.price * quantity;

  @override
  List<Object> get props => [product, quantity];
}
