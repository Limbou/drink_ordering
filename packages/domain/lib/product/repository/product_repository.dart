import 'package:domain/domain.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({
    required String companyId,
    required String categoryName,
    int? page,
  });
}
