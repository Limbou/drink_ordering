import 'package:domain/domain.dart';

sealed class OrderState {
  final PurchaseOrder order;
  final Map<Currency, double>? exchangeRates;

  const OrderState(this.order, this.exchangeRates);

  Cart get cart => order.cart;

  Company? get company => order.company;

  Tip? get tip => order.tip;
}

final class OrderStateInitial extends OrderState {
  OrderStateInitial(
    PurchaseOrder? order,
    Map<Currency, double>? exchangeRates,
  ) : super(
          order ?? const PurchaseOrder.empty(),
          exchangeRates,
        );
}

final class OrderStateOrdering extends OrderState {
  OrderStateOrdering(super.order, super.exchangeRates);
}

final class OrderStateFailed extends OrderState {
  final String message;

  OrderStateFailed(super.order, super.exchangeRates, this.message);
}

final class OrderStateSuccess extends OrderState {
  OrderStateSuccess(super.order, super.exchangeRates);
}
