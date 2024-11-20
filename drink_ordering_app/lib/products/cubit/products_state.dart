import 'package:domain/domain.dart';

sealed class ProductsState {
  const ProductsState(this.companyName, this.categoryName);

  final String? companyName;
  final String? categoryName;
}

class ProductsStateLoading extends ProductsState {
  ProductsStateLoading(super.companyName, super.categoryName);
}

class ProductsStateError extends ProductsState {
  final String message;

  ProductsStateError(super.companyName, super.categoryName, this.message);
}

class ProductsStateLoaded extends ProductsState {
  final List<Product> products;
  final PagingKey pagingKey;

  ProductsStateLoaded(
    super.companyName,
    super.categoryName,
    this.products,
    this.pagingKey,
  );
}

class ProductsStateLoadingMore extends ProductsStateLoaded {
  ProductsStateLoadingMore(
    super.products,
    super.pagingKey,
    super.companyName,
    super.categoryName,
  );
}

class ProductsStateErrorLoadingMore extends ProductsStateLoaded {
  final String message;

  ProductsStateErrorLoadingMore(
    super.products,
    super.pagingKey,
    super.companyName,
    super.categoryName,
    this.message,
  );
}
