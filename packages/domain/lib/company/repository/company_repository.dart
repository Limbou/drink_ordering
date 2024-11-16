import 'package:domain/domain.dart';

abstract class CompanyRepository {
  Future<Company> getCompanyDetails(String companyId);
}
