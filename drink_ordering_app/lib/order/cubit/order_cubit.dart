import 'package:domain/domain.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._submitOrderUseCase) : super(OrderStateInitial(const PurchaseOrder.empty()));

  final SubmitOrderUseCase _submitOrderUseCase;

  void setCompany(Company company) {
    emit(OrderStateInitial(state.order.copyWith(company: company)));
  }

  void addItem(Product product) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.addProduct(product),
        ),
      ),
    );
  }

  void decrementItem(String productId) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.removeSingleProduct(productId),
        ),
      ),
    );
  }

  void removeItem(String productId) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.removeProduct(productId),
        ),
      ),
    );
  }

  void setTip(Tip? tip) {
    emit(OrderStateInitial(state.order.copyWith(tip: () => tip)));
  }

  void removeTip() => setTip(null);

  Future<void> placeOrder() async {
    emit(OrderStateOrdering(state.order));
    try {
      await _submitOrderUseCase(order: state.order);
      emit(OrderStateSuccess(state.order));
    } catch (e) {
      emit(OrderStateFailed(state.order, e.toString()));
    }
  }
}
