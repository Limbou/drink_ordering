import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._submitOrderUseCase) : super(OrderState());

  final SubmitOrderUseCase _submitOrderUseCase;
}

class OrderState {}
