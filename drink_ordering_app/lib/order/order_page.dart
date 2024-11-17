import 'package:drink_ordering_app/order/view/index.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [
          OrderingFromSectionView(),
          CartContentView(),
          TipSectionView(),
          PlaceOrderSectionView(),
        ],
      ),
    );
  }
}
