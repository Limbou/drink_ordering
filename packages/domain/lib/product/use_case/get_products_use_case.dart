import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<List<Product>> call({
    required String companyId,
    required String categoryName,
    int? page,
  }) {
    return _productsRepository.getProducts(
      companyId: companyId,
      categoryName: categoryName,
      page: page,
    );
  }
}
