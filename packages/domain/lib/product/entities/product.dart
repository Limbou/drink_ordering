import 'package:domain/domain.dart';

final class Product {
  final String id;
  final String name;
  final Money price;
  final String alcoholPercentage;
  final String volume;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.alcoholPercentage,
    required this.volume,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          alcoholPercentage == other.alcoholPercentage &&
          volume == other.volume &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ price.hashCode ^ alcoholPercentage.hashCode ^ volume.hashCode ^ imageUrl.hashCode;
}
