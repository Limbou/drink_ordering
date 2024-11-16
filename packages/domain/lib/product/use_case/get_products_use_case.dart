import 'package:domain/domain.dart';

final class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<List<Product>> call({required String companyId, required String categoryId}) {
    return _productsRepository.getProducts(companyId: companyId, categoryId: categoryId);
  }
}
