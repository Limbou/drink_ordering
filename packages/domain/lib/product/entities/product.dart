import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

final class Product extends Equatable {
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
  List<Object> get props => [id, name, price, alcoholPercentage, volume, imageUrl];
}
