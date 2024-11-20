import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
final class ProductRepositoryImpl implements ProductsRepository {
  @override
  Future<ProductsResponse> getProducts({
    required String companyName,
    required String categoryName,
    int? page = 0,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    return ProductsResponse(
      products: [
        ...productsCollection,
        ...productsCollection.shuffled(),
        ...productsCollection.shuffled(),
        ...productsCollection.shuffled(),
      ].take(20).toList(),
      pagingKey: PagingKey(
        next: (page ?? 0) + 20,
        isLast: (page ?? 0) >= 100,
      ),
    );
  }

  final productsCollection = [
    Product(
      id: 'product1',
      name: 'Diggles Artisan Ale',
      price: Money.fromDouble(amount: 5.99),
      alcoholPercentage: '4,5%',
      volume: '0,5l',
      imageName: 'diggles.jpeg',
    ),
    Product(
      id: 'product2',
      name: 'Boiler Brewing',
      price: Money.fromDouble(amount: 4.99),
      alcoholPercentage: '4,2%',
      volume: '0,4l',
      imageName: 'boiler.jpeg',
    ),
    Product(
      id: 'product3',
      name: 'Dainton Brewery',
      price: Money.fromDouble(amount: 3.99),
      alcoholPercentage: '4,5%',
      volume: '0,5l',
      imageName: 'dainton.png',
    ),
    Product(
      id: 'product4',
      name: 'La Brayonne Beer',
      price: Money.fromDouble(amount: 4.99),
      alcoholPercentage: '4,2%',
      volume: '0,4l',
      imageName: 'brayonne.png',
    ),
    Product(
      id: 'product5',
      name: "Angel's Share Barrel House",
      price: Money.fromDouble(amount: 4.99),
      alcoholPercentage: '4,2%',
      volume: '0,4l',
      imageName: 'angels.jpeg',
    ),
  ];
}

extension on List<Product> {
  List<Product> shuffled() {
    return toList()..shuffle();
  }
}
