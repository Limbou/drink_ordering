import 'package:domain/domain.dart';
import 'package:drink_ordering_app/common/widgets/index.dart';
import 'package:drink_ordering_app/company_details/views/tab_bar/company_tab_bar.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/products/index.dart';
import 'package:drink_ordering_app/products/widgets/paged_list_view.dart';
import 'package:drink_ordering_app/products/widgets/product_tile.dart';
import 'package:drink_ordering_app/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    required this.companyName,
    required this.categoryName,
    super.key,
  });

  final String companyName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..init(companyName: companyName, categoryName: categoryName),
      child: AppScaffold(
        title: companyName,
        gradientStartFraction: 0.2,
        background: Image.asset(AppAssets.barBackground),
        body: BlocListener<OrderCubit, OrderState>(
          listener: (context, state) => context.read<ProductsCubit>().changeCurrency(
                state.order.currency,
                state.exchangeRates,
              ),
          child: BlocConsumer<ProductsCubit, ProductsState>(
            listener: (context, state) {
              if (state is ProductsStateError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return switch (state) {
                ProductsStateLoading() => const Center(child: CircularProgressIndicator()),
                ProductsStateError(message: final message) => Center(child: Text(message)),
                ProductsStateLoaded(products: final products) => _ProductsPageBody(
                    categoryName: categoryName,
                    products: products,
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _ProductsPageBody extends StatelessWidget {
  const _ProductsPageBody({
    required this.categoryName,
    required this.products,
  });

  final String categoryName;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: CompanyTabBar(
        orderPage: _ProductsList(
          categoryName: categoryName,
          products: products,
        ),
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({
    required this.categoryName,
    required this.products,
  });

  final String categoryName;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: CurrencySelector(),
              ),
            ],
          ),
        ),
        Expanded(
          child: PagedListView(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductTile(key: Key(product.id), product: product);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 32),
            onLoadMore: () => context.read<ProductsCubit>().loadMore(),
            isLoadingMore: context.select<ProductsCubit, bool>((cubit) => cubit.state is ProductsStateLoadingMore),
            isLastPage: context.select<ProductsCubit, bool>((cubit) {
              final state = cubit.state;
              return state is ProductsStateLoaded && state.pagingKey.isLast;
            }),
          ),
        ),
      ],
    );
  }
}
