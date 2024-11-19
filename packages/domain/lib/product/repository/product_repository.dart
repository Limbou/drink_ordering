import 'package:domain/domain.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({
    required String companyName,
    required String categoryName,
    int? page,
  });
}
