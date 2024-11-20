import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<ProductsResponse> call({
    required String companyName,
    required String categoryName,
    int? page,
  }) {
    return _productsRepository.getProducts(
      companyName: companyName,
      categoryName: categoryName,
      page: page,
    );
  }
}
