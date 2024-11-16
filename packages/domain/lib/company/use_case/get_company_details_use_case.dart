import 'package:domain/domain.dart';

final class GetCompanyDetailsUseCase {
  final CompanyRepository _companyRepository;

  GetCompanyDetailsUseCase(this._companyRepository);

  Future<Company> call({required String companyId}) {
    return _companyRepository.getCompanyDetails(companyId);
  }
}
