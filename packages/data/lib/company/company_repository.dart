import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CompanyRepository)
final class CompanyRepositoryImpl implements CompanyRepository {
  @override
  Future<Company> getCompanyDetails(String companyId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Company(
      id: 'company1',
      name: "Pepito's Pub",
      tags: 'Bar, Craft beer',
      isOpen: true,
      rating: '4.9',
      numberOfRatings: 636,
      coverImageUrl: '',
      productsCategories: [
        ProductCategory(id: 'category1', name: 'Beer', icon: '🍺'),
        ProductCategory(id: 'category2', name: 'Cocktails', icon: '🍹'),
        ProductCategory(id: 'category3', name: 'Wine', icon: '🍷'),
        ProductCategory(id: 'category4', name: 'Liquor', icon: '🥃'),
      ],
    );
  }
}
