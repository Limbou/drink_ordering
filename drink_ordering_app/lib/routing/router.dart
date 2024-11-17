import 'package:drink_ordering_app/company_categorized_page/company_categorized_products_page.dart';
import 'package:drink_ordering_app/company_details/company_details_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const CompanyDetailsPage(), routes: [
      GoRoute(
        path: '/products',
        builder: (context, state) => CompanyCategorizedProductsPage(
          categoryId: state.uri.queryParameters['categoryId']!,
          companyId: state.uri.queryParameters['companyId']!,
        ),
      ),
    ]),
  ],
);
