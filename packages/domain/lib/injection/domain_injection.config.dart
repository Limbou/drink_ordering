// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/company/use_case/get_company_details_use_case.dart'
    as _i360;
import 'package:domain/domain.dart' as _i494;
import 'package:domain/order/use_cases/submit_order_use_case.dart' as _i670;
import 'package:domain/product/use_case/get_products_use_case.dart' as _i349;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i360.GetCompanyDetailsUseCase>(
        () => _i360.GetCompanyDetailsUseCase(gh<_i494.CompanyRepository>()));
    gh.factory<_i670.SubmitOrderUseCase>(
        () => _i670.SubmitOrderUseCase(gh<_i494.OrderRepository>()));
    gh.factory<_i349.GetProductsUseCase>(
        () => _i349.GetProductsUseCase(gh<_i494.ProductsRepository>()));
    return this;
  }
}
