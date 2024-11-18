import 'package:drink_ordering_app/common/widgets/app_scaffold.dart';
import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/order/view/index.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      backgroundColor: AppColors.grey3333,
      appBar: MyOrderAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 32),
              sliver: OrderingFromSectionView(),
            ),
            CartContentView(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              sliver: TipSectionView(),
            ),
            PlaceOrderSectionView(),
          ],
        ),
      ),
    );
  }
}
