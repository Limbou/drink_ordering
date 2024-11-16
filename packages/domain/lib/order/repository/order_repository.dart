import 'package:domain/domain.dart';

abstract class OrderRepository {
  Future<void> submitOrder(Order order);
}
