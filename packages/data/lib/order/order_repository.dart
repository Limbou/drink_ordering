import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
final class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<void> submitOrder(PurchaseOrder order) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<Map<Currency, double>> getExchangeRates() {
    return Future.value({
      CurrencyUsd(): 1.0,
      CurrencyEur(): 0.95,
      CurrencyPln(): 4.11,
    });
  }
}
