import 'package:domain/domain.dart';

abstract class OrderRepository {
  Future<void> submitOrder(PurchaseOrder order);
  Future<Map<Currency, double>> getExchangeRates();
}
