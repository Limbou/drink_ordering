import 'package:drink_ordering_app/common/widgets/index.dart';
import 'package:drink_ordering_app/company_details/company_details_cubit.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:drink_ordering_app/company_details/views/company_summary_view.dart';
import 'package:drink_ordering_app/company_details/views/tab_bar/company_order_tab_view.dart';
import 'package:drink_ordering_app/company_details/views/tab_bar/company_tab_bar.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:drink_ordering_app/order/index.dart';
import 'package:drink_ordering_app/theme/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsPage extends StatelessWidget {
  const CompanyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompanyDetailsCubit>()..init(),
      child: BlocListener<CompanyDetailsCubit, CompanyDetailsState>(
        listener: (context, state) {
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
        },
        child: AppScaffold(
          background: Image.asset(AppAssets.barBackground),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
                builder: (context, state) {
                  return switch (state) {
                    CompanyDetailsStateLoading() => const Center(child: CircularProgressIndicator()),
                    CompanyDetailsStateError(message: final message) => Center(child: Text(message)),
                    CompanyDetailsStateLoaded(company: final company) => Column(
                        children: [
                          CompanySummaryView(company: company),
                          const SizedBox(height: 16),
                          const Expanded(
                            child: CompanyTabBar(
                              orderPage: CompanyOrderTabView(),
                            ),
                          ),
                        ],
                      ),
                  };
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
