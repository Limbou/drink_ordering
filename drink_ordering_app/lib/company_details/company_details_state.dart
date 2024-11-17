import 'package:domain/domain.dart';

sealed class CompanyDetailsState {}

class CompanyDetailsStateLoading extends CompanyDetailsState {}

class CompanyDetailsStateError extends CompanyDetailsState {
  final String message;

  CompanyDetailsStateError(this.message);
}

class CompanyDetailsStateLoaded extends CompanyDetailsState {
  final Company company;

  CompanyDetailsStateLoaded(this.company);
}
