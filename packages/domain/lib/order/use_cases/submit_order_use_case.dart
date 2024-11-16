import 'package:domain/domain.dart';

final class SubmitOrderUseCase {
  final OrderRepository _orderRepository;

  SubmitOrderUseCase(this._orderRepository);

  Future<void> call({required Order order}) {
    return _orderRepository.submitOrder(order);
  }
}
