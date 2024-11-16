import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
final class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<void> submitOrder(PurchaseOrder order) {
    return Future.delayed(const Duration(seconds: 2));
  }
}
