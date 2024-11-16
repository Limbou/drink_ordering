import 'package:collection/collection.dart';
import 'package:domain/domain.dart';

final class Cart {
  final List<CartEntry> entries;

  const Cart({
    required this.entries,
  });

  const Cart.empty() : entries = const [];

  Money get total {
    if (entries.isEmpty) {
      return Money.fromDouble(amount: 0);
    }
    return entries.fold(
      Money.fromDouble(amount: 0, currency: entries.first.product.price.currency),
      (total, entry) => total + entry.totalPrice,
    );
  }

  Cart addProduct(Product product) {
    final existingEntry = entries.firstWhereOrNull((entry) => entry.product == product);
    if (existingEntry != null) {
      final updatedEntry = existingEntry.increment();
      return Cart(entries: [
        ...entries.where((entry) => entry != existingEntry),
        updatedEntry,
      ]);
    }
    return Cart(entries: [...entries, CartEntry.newEntry(product: product)]);
  }

  Cart removeSingleProduct(String productId) {
    final product = entries.firstWhereOrNull((entry) => entry.product.id == productId);
    if (product == null) {
      return this;
    }
    if (product.quantity == 1) {
      return Cart(entries: entries.where((entry) => entry != product).toList());
    }
    final updatedProduct = product.decrement();
    return Cart(entries: [
      ...entries.where((entry) => entry != product),
      updatedProduct,
    ]);
  }

  Cart removeProduct(String productId) {
    return Cart(entries: entries.where((entry) => entry.product.id != productId).toList());
  }
}

final class CartEntry {
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
}
