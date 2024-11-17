// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i494;
import 'package:drink_ordering_app/cart/cart_cubit.dart' as _i536;
import 'package:drink_ordering_app/company_categorized_page/company_categorized_products_cubit.dart'
    as _i61;
import 'package:drink_ordering_app/company_details/company_details_cubit.dart'
    as _i865;
import 'package:drink_ordering_app/order/order_cubit.dart' as _i401;
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
    gh.factory<_i536.CartCubit>(() => _i536.CartCubit());
    gh.factory<_i865.CompanyDetailsCubit>(
        () => _i865.CompanyDetailsCubit(gh<_i494.GetCompanyDetailsUseCase>()));
    gh.factory<_i61.CompanyCategorizedProductsCubit>(() =>
        _i61.CompanyCategorizedProductsCubit(gh<_i494.GetProductsUseCase>()));
    gh.factory<_i401.OrderCubit>(
        () => _i401.OrderCubit(gh<_i494.SubmitOrderUseCase>()));
    return this;
  }
}
