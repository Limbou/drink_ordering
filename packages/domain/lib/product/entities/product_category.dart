import 'package:equatable/equatable.dart';

final class ProductCategory extends Equatable {
  final String id;
  final String name;
  final int iconData;

  const ProductCategory({
    required this.id,
    required this.name,
    required this.iconData,
  });

  @override
  List<Object> get props => [id, name, iconData];
}
