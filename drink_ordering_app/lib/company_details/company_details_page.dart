import 'package:drink_ordering_app/common/app_bar/cart_app_bar.dart';
import 'package:drink_ordering_app/company_details/company_details_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:drink_ordering_app/company_details/views/category_tile.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/routing/app_navigator.dart';
import 'package:drink_ordering_app/theme/app_assets.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompanyDetailsCubit>()..init(),
      child: Scaffold(
          appBar: const CartAppBar(),
          extendBodyBehindAppBar: true,
          body: Stack(children: [
            Image.asset(AppAssets.barBackground),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppGradients.greyMainGradient,
              ),
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _CompanyDetailsHeader(),
                      Expanded(child: _CompanyDetailsCategories()),
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

class _CompanyDetailsHeader extends StatelessWidget {
  const _CompanyDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyDetailsCubit, CompanyDetailsState>(listener: (context, state) {
      switch (state) {
        case CompanyDetailsStateError(message: final message):
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          break;
        case CompanyDetailsStateLoaded(company: final company):
          context.read<OrderCubit>().setCompany(company);
          break;
        default:
          break;
      }
    }, builder: (context, state) {
      return switch (state) {
        CompanyDetailsStateLoading() => const Center(child: CircularProgressIndicator()),
        CompanyDetailsStateError(message: final message) => Center(child: Text(message)),
        CompanyDetailsStateLoaded(company: final company) => Column(
            children: [
              const SizedBox(height: 200),
              Text(company.name, style: TextStyle(color: AppColors.whiteEEF1)),
              Text(company.rating),
            ],
          ),
      };
    });
  }
}

class _CompanyDetailsCategories extends StatelessWidget {
  const _CompanyDetailsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
      builder: (context, state) {
        if (state is! CompanyDetailsStateLoaded) {
          return const SizedBox();
        }

        return GridView.builder(
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
              onTap: () => AppNavigator.goToProductsPage(context, companyId: state.company.id, categoryId: category.id),
            );
          },
        );
      },
    );
  }
}
