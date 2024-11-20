import 'package:drink_ordering_app/company_details/company_details_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:drink_ordering_app/company_details/views/category_tile.dart';
import 'package:drink_ordering_app/l10n/translations.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyOrderTabView extends StatelessWidget {
  const CompanyOrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
      builder: (context, state) {
        if (state is! CompanyDetailsStateLoaded) {
          return const SizedBox();
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 32),
              sliver: SliverToBoxAdapter(
                child: Text(
                  Translations.of(context).company_menu.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(
                child: _OrderSearchBar(),
              ),
            ),
            SliverSafeArea(
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: state.company.productsCategories.length,
                itemBuilder: (context, index) {
                  final category = state.company.productsCategories[index];
                  return CategoryTile(
                    category: category,
                    onTap: () => AppNavigator.goToProductsPage(
                      context,
                      companyName: state.company.name,
                      categoryName: category.name,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _OrderSearchBar extends StatelessWidget {
  const _OrderSearchBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 36,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                Translations.of(context).company_search_hint,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
