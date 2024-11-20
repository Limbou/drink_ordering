import 'package:domain/domain.dart';
import 'package:drink_ordering_app/order/cubit/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class OrderCubit extends Cubit<OrderState> {
  OrderCubit(
    this._submitOrderUseCase,
    this._getExchangeRatesUseCase,
  ) : super(OrderStateInitial(const PurchaseOrder.empty(), null));

  final SubmitOrderUseCase _submitOrderUseCase;
  final GetExchangeRatesUseCase _getExchangeRatesUseCase;

  Future<void> init() async {
    try {
      final exchangeRates = await _getExchangeRatesUseCase();
      emit(OrderStateInitial(state.order, exchangeRates));
    } catch (_) {}
  }

  void setCompany(Company company) {
    emit(OrderStateInitial(
      state.order.copyWith(company: company),
      state.exchangeRates,
    ));
  }

  void addItem(Product product) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.addProduct(product),
        ),
        state.exchangeRates,
      ),
    );
  }

  void decrementItem(String productId) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.removeSingleProduct(productId),
        ),
        state.exchangeRates,
      ),
    );
  }

  void removeItem(String productId) {
    emit(
      OrderStateInitial(
        state.order.copyWith(
          cart: state.order.cart.removeProduct(productId),
        ),
        state.exchangeRates,
      ),
    );
  }

  void setTip(Tip? tip) {
    emit(OrderStateInitial(
      state.order.copyWith(tip: () => tip),
      state.exchangeRates,
    ));
  }

  void removeTip() => setTip(null);

  void changeCurrency(Currency currency) {
    final exchangeRates = state.exchangeRates ?? {};
    if (exchangeRates.isEmpty) {
      return;
    }

    emit(OrderStateInitial(
      state.order.withNewCurrency(currency, exchangeRates),
      state.exchangeRates,
    ));
  }

  Future<void> placeOrder() async {
    emit(OrderStateOrdering(state.order, state.exchangeRates));
    try {
      await _submitOrderUseCase(order: state.order);
      emit(OrderStateSuccess(state.order, state.exchangeRates));
    } catch (e) {
      emit(OrderStateFailed(state.order, state.exchangeRates, e.toString()));
    }
  }

  void clearOrder() {
    emit(OrderStateInitial(const PurchaseOrder.empty(), state.exchangeRates));
  }
}
