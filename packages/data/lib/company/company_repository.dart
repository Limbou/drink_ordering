import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CompanyRepository)
final class CompanyRepositoryImpl implements CompanyRepository {
  @override
  Future<Company> getCompanyDetails(String companyId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Company(
      id: 'company1',
      name: "Pepito's Bar",
      tags: 'Bar, Craft beer',
      isOpen: true,
      rating: '4.9',
      numberOfRatings: 636,
      coverImageUrl: '',
      productsCategories: [
        ProductCategory(id: 'category1', name: 'Beer', iconData: 0xe047),
        ProductCategory(id: 'category2', name: 'Cocktails', iconData: 0xe047),
        ProductCategory(id: 'category3', name: 'Wine', iconData: 0xe047),
        ProductCategory(id: 'category4', name: 'Liquor', iconData: 0xe047),
      ],
    );
  }
}
