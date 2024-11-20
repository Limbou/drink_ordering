import 'package:domain/domain.dart';

abstract class ProductsRepository {
  Future<ProductsResponse> getProducts({
    required String companyName,
    required String categoryName,
    int? page,
  });
}
