import 'package:domain/domain.dart';
import 'package:drink_ordering_app/company_categorized_page/company_categorized_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class CompanyCategorizedProductsCubit extends Cubit<CompanyCategorizedProductsState> {
  CompanyCategorizedProductsCubit(this._getProductsUseCase) : super(CompanyCategorizedProductsStateLoading());

  final GetProductsUseCase _getProductsUseCase;

  Future<void> init({required String companyId, required String categoryId}) async {
    emit(CompanyCategorizedProductsStateLoading());
    try {
      final products = await _getProductsUseCase(companyId: 'company1', categoryId: categoryId);
      emit(CompanyCategorizedProductsStateLoaded(products));
    } catch (e) {
      emit(CompanyCategorizedProductsStateError(e.toString()));
    }
  }
}
