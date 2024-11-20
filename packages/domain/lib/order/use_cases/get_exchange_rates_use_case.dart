import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetExchangeRatesUseCase {
  final OrderRepository _orderRepository;

  GetExchangeRatesUseCase(this._orderRepository);

  Future<Map<Currency, double>> call() {
    return _orderRepository.getExchangeRates();
  }
}
