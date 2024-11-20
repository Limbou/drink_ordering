import 'package:domain/domain.dart';
import 'package:drink_ordering_app/products/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductsUseCase) : super(ProductsStateLoading());

  final GetProductsUseCase _getProductsUseCase;

  Future<void> init({required String companyName, required String categoryName}) async {
    emit(ProductsStateLoading());
    try {
      final products = await _getProductsUseCase(companyName: companyName, categoryName: categoryName);
      emit(ProductsStateLoaded(products));
    } catch (e) {
      emit(ProductsStateError(e.toString()));
    }
  }

  void changeCurrency(Currency currency, Map<Currency, double>? exchangeRates) {
    final state = this.state;
    if (exchangeRates == null || state is! ProductsStateLoaded) return;

    final products = state.products.map((product) => product.withNewCurrency(currency, exchangeRates)).toList();
    emit(ProductsStateLoaded(products));
  }
}
