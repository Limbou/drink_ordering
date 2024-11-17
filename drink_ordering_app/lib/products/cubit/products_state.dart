import 'package:domain/domain.dart';

sealed class ProductsState {}

class ProductsStateLoading extends ProductsState {}

class ProductsStateError extends ProductsState {
  final String message;

  ProductsStateError(this.message);
}

class ProductsStateLoaded extends ProductsState {
  final List<Product> products;

  ProductsStateLoaded(this.products);
}
