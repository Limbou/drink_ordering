import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class CartCubit extends Cubit<Cart> {
  CartCubit() : super(const Cart.empty());

  void addItem(Product product) {
    emit(state.addProduct(product));
  }

  void decrementItem(String productId) {
    emit(state.removeSingleProduct(productId));
  }

  void removeItem(String productId) {
    emit(state.removeProduct(productId));
  }
}
