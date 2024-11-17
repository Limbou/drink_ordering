import 'package:domain/domain.dart';
import 'package:drink_ordering_app/company_details/company_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
final class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  CompanyDetailsCubit(this._getCompanyDetailsUseCase) : super(CompanyDetailsStateLoading());

  final GetCompanyDetailsUseCase _getCompanyDetailsUseCase;

  Future<void> init() async {
    emit(CompanyDetailsStateLoading());
    try {
      final companyDetails = await _getCompanyDetailsUseCase(companyId: 'company1');
      emit(CompanyDetailsStateLoaded(companyDetails));
    } catch (e) {
      emit(CompanyDetailsStateError(e.toString()));
    }
  }
}
