import 'package:domain/domain.dart';

extension ImagePath on Product {
  String get imagePath => 'assets/images/$imageName';
}
