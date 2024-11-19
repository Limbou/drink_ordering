import 'package:equatable/equatable.dart';

final class ProductCategory extends Equatable {
  final String id;
  final String name;
  final String icon;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  @override
  List<Object> get props => [id, name, icon];
}
