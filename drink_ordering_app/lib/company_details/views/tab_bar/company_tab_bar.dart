import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum CompanyDetailsTab {
  order('Order'),
  info('Info'),
  locations('Locations');

  final String label;
  const CompanyDetailsTab(this.label);
}

class CompanyTabBar extends StatelessWidget {
  const CompanyTabBar({required this.orderPage, super.key});

  final Widget orderPage;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CompanyDetailsTab.values.length,
      child: Column(
        children: [
          const TabBar(
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.whiteEEF1,
                  width: 1,
                ),
              ),
            ),
            labelStyle: TextStyle(
              color: AppColors.whiteEEF1,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            labelPadding: EdgeInsets.only(top: 6, bottom: 6, right: 32),
            unselectedLabelColor: AppColors.grey9999,
            dividerColor: AppColors.grey5050,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Order'),
              Tab(text: 'Info'),
              Tab(text: 'Locations'),
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              orderPage,
              const _ComingSoonTabView(),
              const _ComingSoonTabView(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ComingSoonTabView extends StatelessWidget {
  const _ComingSoonTabView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'COMING SOON!',
        style: TextStyle(color: AppColors.whiteEEF1, fontSize: 24),
      ),
    );
  }
}
