import 'package:drink_ordering_app/company_details/company_details_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:drink_ordering_app/company_details/views/category_tile.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
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
            const SliverPadding(
              padding: EdgeInsets.only(top: 32),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.grey9999,
                    fontWeight: FontWeight.bold,
                  ),
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
                    onTap: () => AppNavigator.goToProductsPage(context,
                        companyId: state.company.id, categoryName: category.name),
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
        border: Border.all(color: AppColors.grey5050, width: 1),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: AppColors.whiteEEF1,
              size: 36,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'What are you looking for?',
                style: TextStyle(
                  color: AppColors.grey9999,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
