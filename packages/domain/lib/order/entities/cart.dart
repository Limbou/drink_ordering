import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

final class Cart extends Equatable {
  final Map<String, CartEntry> _entriesMap;

  const Cart._(this._entriesMap);

  const Cart.empty() : _entriesMap = const {};

  @override
  List<Object> get props => [_entriesMap];

  List<CartEntry> get entries => _entriesMap.values.toList();

  bool get isEmpty => _entriesMap.isEmpty;

  Money get total {
    if (_entriesMap.isEmpty) {
      return Money.fromDouble(amount: 0);
    }
    return entries.fold(
      Money.fromDouble(amount: 0, currency: entries.first.product.price.currency),
      (total, entry) => total + entry.totalPrice,
    );
  }

  Duration? get estimatedCompletionTime => entries.isEmpty ? null : Duration(minutes: entries.length * 5);

  Cart addProduct(Product product) {
    final entries = Map<String, CartEntry>.from(_entriesMap);
    entries.update(product.id, (entry) => entry.increment(), ifAbsent: () => CartEntry.newEntry(product: product));
    return Cart._(entries);
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
    return Cart._(entries);
  }

  Cart removeProduct(String productId) {
    final entries = Map<String, CartEntry>.from(_entriesMap);
    entries.remove(productId);
    return Cart._(entries);
  }

  int getQuantity(String productId) {
    final entry = _entriesMap[productId];
    return entry?.quantity ?? 0;
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

  Money get totalPrice => product.price * quantity;

  @override
  List<Object> get props => [product, quantity];
}
