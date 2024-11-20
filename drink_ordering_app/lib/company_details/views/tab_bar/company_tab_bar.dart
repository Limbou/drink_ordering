import 'package:drink_ordering_app/l10n/translations.dart';
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
          TabBar(
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
            ),
            labelStyle: Theme.of(context).textTheme.headlineMedium,
            labelPadding: const EdgeInsets.only(top: 6, bottom: 6, right: 32),
            unselectedLabelColor: Theme.of(context).colorScheme.surface,
            dividerColor: Theme.of(context).colorScheme.primary,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: Translations.of(context).company_tab_bar_order),
              Tab(text: Translations.of(context).company_tab_bar_info),
              Tab(text: Translations.of(context).company_tab_bar_location),
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
    return Center(
      child: Text(
        Translations.of(context).company_tab_bar_coming_soon.toUpperCase(),
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
