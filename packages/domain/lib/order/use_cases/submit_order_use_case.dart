import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class SubmitOrderUseCase {
  final OrderRepository _orderRepository;

  SubmitOrderUseCase(this._orderRepository);

  Future<void> call({required PurchaseOrder order}) {
    return _orderRepository.submitOrder(order);
  }
}
