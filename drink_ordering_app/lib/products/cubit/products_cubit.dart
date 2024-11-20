import 'package:domain/domain.dart';
import 'package:drink_ordering_app/products/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductsUseCase) : super(ProductsStateLoading(null, null));

  final GetProductsUseCase _getProductsUseCase;

  Future<void> init({required String companyName, required String categoryName}) async {
    emit(ProductsStateLoading(companyName, categoryName));
    try {
      final response = await _getProductsUseCase(companyName: companyName, categoryName: categoryName);
      emit(ProductsStateLoaded(state.companyName, state.categoryName, response.products, response.pagingKey));
    } catch (e) {
      emit(ProductsStateError(
        state.companyName,
        state.categoryName,
        e.toString(),
      ));
    }
  }

  Future<void> loadMore() async {
    final state = this.state;
    if (state is! ProductsStateLoaded || state.pagingKey.isLast) return;

    try {
      emit(ProductsStateLoadingMore(state.companyName, state.companyName, state.products, state.pagingKey));
      final response = await _getProductsUseCase(
        companyName: state.companyName!,
        categoryName: state.categoryName!,
        page: state.pagingKey.next,
      );

      final products = state.products + response.products;
      emit(ProductsStateLoaded(state.companyName, state.categoryName, products, response.pagingKey));
    } catch (e) {
      emit(ProductsStateErrorLoadingMore(
        state.companyName,
        state.categoryName,
        state.products,
        state.pagingKey,
        e.toString(),
      ));
    }
  }

  void changeCurrency(Currency currency, Map<Currency, double>? exchangeRates) {
    final state = this.state;
    if (exchangeRates == null || state is! ProductsStateLoaded) return;

    final products = state.products.map((product) => product.withNewCurrency(currency, exchangeRates)).toList();
    emit(ProductsStateLoaded(state.companyName, state.categoryName, products, state.pagingKey));
  }
}
