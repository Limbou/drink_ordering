import 'package:drink_ordering_app/cart/cart_cubit.dart';
import 'package:drink_ordering_app/company_categorized_page/company_categorized_products_cubit.dart';
import 'package:drink_ordering_app/company_categorized_page/company_categorized_products_state.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyCategorizedProductsPage extends StatelessWidget {
  const CompanyCategorizedProductsPage({
    required this.companyId,
    required this.categoryId,
    super.key,
  });

  final String companyId;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompanyCategorizedProductsCubit>()..init(companyId: companyId, categoryId: categoryId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            Badge.count(
              count: context.watch<CartCubit>().state.entries.length,
              backgroundColor: Colors.red,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: const CompanyCategorizedProductsHeader(),
      ),
    );
  }
}

class CompanyCategorizedProductsHeader extends StatelessWidget {
  const CompanyCategorizedProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCategorizedProductsCubit, CompanyCategorizedProductsState>(builder: (context, state) {
      return switch (state) {
        CompanyCategorizedProductsStateLoading() => const Center(child: CircularProgressIndicator()),
        CompanyCategorizedProductsStateError(message: final message) => Center(child: Text(message)),
        CompanyCategorizedProductsStateLoaded(products: final products) => ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  onPressed: () => context.read<CartCubit>().addItem(product),
                  icon: const Icon(Icons.add),
                ),
              );
            })
      };
    });
  }
}
