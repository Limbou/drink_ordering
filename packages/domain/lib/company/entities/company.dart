import 'package:domain/product/entities/product_category.dart';

final class Company {
  final String id;
  final String name;
  final String logoUrl;
  final String rating;
  final int numberOfRatings;
  final String tags;
  final bool isOpen;
  final List<ProductCategory> productsCategories;

  const Company({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.rating,
    required this.numberOfRatings,
    required this.tags,
    required this.isOpen,
    required this.productsCategories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Company &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          logoUrl == other.logoUrl &&
          rating == other.rating &&
          numberOfRatings == other.numberOfRatings &&
          tags == other.tags &&
          isOpen == other.isOpen &&
          productsCategories == other.productsCategories;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      logoUrl.hashCode ^
      rating.hashCode ^
      numberOfRatings.hashCode ^
      tags.hashCode ^
      isOpen.hashCode ^
      productsCategories.hashCode;
}
