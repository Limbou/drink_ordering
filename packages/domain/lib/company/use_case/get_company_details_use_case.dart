import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
final class GetCompanyDetailsUseCase {
  final CompanyRepository _companyRepository;

  GetCompanyDetailsUseCase(this._companyRepository);

  Future<Company> call({required String companyId}) {
    return _companyRepository.getCompanyDetails(companyId);
  }
}
