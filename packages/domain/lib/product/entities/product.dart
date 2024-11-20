import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

final class Product extends Equatable {
  final String id;
  final String name;
  final Money price;
  final String alcoholPercentage;
  final String volume;
  final String imageName;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.alcoholPercentage,
    required this.volume,
    required this.imageName,
  });

  @override
  List<Object> get props => [id, name, price, alcoholPercentage, volume, imageName];

  Product withNewCurrency(Currency currency, Map<Currency, double> exchangeRates) {
    return Product(
      id: id,
      name: name,
      price: price.withNewCurrency(currency, exchangeRates),
      alcoholPercentage: alcoholPercentage,
      volume: volume,
      imageName: imageName,
    );
  }
}
