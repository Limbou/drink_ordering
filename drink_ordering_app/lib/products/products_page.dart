import 'package:drink_ordering_app/common/widgets/index.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/products/index.dart';
import 'package:drink_ordering_app/products/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    required this.companyId,
    required this.categoryId,
    super.key,
  });

  final String companyId;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..init(companyId: companyId, categoryId: categoryId),
      child: const Scaffold(
        appBar: CartAppBar(),
        body: _CompanyCategorizedProductsList(),
      ),
    );
  }
}

class _CompanyCategorizedProductsList extends StatelessWidget {
  const _CompanyCategorizedProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsStateError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return switch (state) {
          ProductsStateLoading() => const Center(child: CircularProgressIndicator()),
          ProductsStateError(message: final message) => Center(child: Text(message)),
          ProductsStateLoaded(products: final products) => ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductTile(product: product);
              },
            ),
        };
      },
    );
  }
}
