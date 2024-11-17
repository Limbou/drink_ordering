import 'package:domain/domain.dart';

sealed class CompanyCategorizedProductsState {}

class CompanyCategorizedProductsStateLoading extends CompanyCategorizedProductsState {}

class CompanyCategorizedProductsStateError extends CompanyCategorizedProductsState {
  final String message;

  CompanyCategorizedProductsStateError(this.message);
}

class CompanyCategorizedProductsStateLoaded extends CompanyCategorizedProductsState {
  final List<Product> products;

  CompanyCategorizedProductsStateLoaded(this.products);
}
