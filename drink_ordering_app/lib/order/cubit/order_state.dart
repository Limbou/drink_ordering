import 'package:domain/domain.dart';

sealed class OrderState {
  final PurchaseOrder order;

  const OrderState(this.order);

  Cart get cart => order.cart;

  Company? get company => order.company;

  Money? get tip => order.tip;
}

final class OrderStateInitial extends OrderState {
  OrderStateInitial(PurchaseOrder? order) : super(order ?? const PurchaseOrder.empty());
}

final class OrderStateOrdering extends OrderState {
  OrderStateOrdering(super.order);
}

final class OrderStateFailed extends OrderState {
  final String message;

  OrderStateFailed(super.order, this.message);
}

final class OrderStateSuccess extends OrderState {
  OrderStateSuccess(super.order);
}
