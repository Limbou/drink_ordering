import 'package:drink_ordering_app/cart/cart_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompanyDetailsCubit>()..init(),
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
          body: const Column(
            children: [
              CompanyDetailsHeader(),
              Expanded(child: CompanyDetailsCategories()),
            ],
          )),
    );
  }
}

class CompanyDetailsHeader extends StatelessWidget {
  const CompanyDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(builder: (context, state) {
      return switch (state) {
        CompanyDetailsStateLoading() => const Center(child: CircularProgressIndicator()),
        CompanyDetailsStateError(message: final message) => Center(child: Text(message)),
        CompanyDetailsStateLoaded(company: final company) => Column(
            children: [
              Text(company.name),
              Text(company.rating),
            ],
          ),
      };
    });
  }
}

class CompanyDetailsCategories extends StatelessWidget {
  const CompanyDetailsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(builder: (context, state) {
      if (state is! CompanyDetailsStateLoaded) {
        return const SizedBox();
      }

      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: state.company.productsCategories.length,
          itemBuilder: (context, index) {
            final category = state.company.productsCategories[index];
            return InkWell(
              onTap: () => context.go('/products?categoryId=${category.id}&companyId=company1'),
              child: Card(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Text(category.name),
                  ],
                ),
              ),
            );
          });
    });
  }
}
