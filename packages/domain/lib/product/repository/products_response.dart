import 'package:domain/domain.dart';

final class ProductsResponse {
  ProductsResponse({
    required this.products,
    required this.pagingKey,
  });

  final List<Product> products;
  final PagingKey pagingKey;
}
