import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<List<Product>> call({
    required String companyId,
    required String categoryId,
    int? page,
  }) {
    return _productsRepository.getProducts(
      companyId: companyId,
      categoryId: categoryId,
      page: page,
    );
  }
}
