import 'package:domain/domain.dart';

final class Product {
  final String id;
  final String name;
  final String description;
  final ProductCategory category;
  final Money price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          category == other.category &&
          price == other.price;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode ^ category.hashCode ^ price.hashCode;
}
