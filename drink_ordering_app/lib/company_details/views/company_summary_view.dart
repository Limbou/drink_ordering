import 'package:domain/domain.dart';
import 'package:drink_ordering_app/company_details/views/company_ratings_and_tags_section_view.dart';
import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CompanySummaryView extends StatelessWidget {
  const CompanySummaryView({required this.company, super.key});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        if (company.isOpen) const _OpenNowView(),
        const SizedBox(height: 8),
        _CompanyName(companyName: company.name),
        const SizedBox(height: 8),
        RatingsAndTagsSectionView(company: company),
      ],
    );
  }
}

class _OpenNowView extends StatelessWidget {
  const _OpenNowView();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.greenDark,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          'OPEN NOW',
          style: TextStyle(color: AppColors.greenLight),
        ),
      ),
    );
  }
}

class _CompanyName extends StatelessWidget {
  const _CompanyName({required this.companyName});

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Text(
      companyName,
      style: const TextStyle(
        fontSize: 36,
        color: AppColors.whiteEEF1,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
