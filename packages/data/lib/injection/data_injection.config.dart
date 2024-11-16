// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/company/company_repository.dart' as _i56;
import 'package:data/order/order_repository.dart' as _i155;
import 'package:data/product/product_repository.dart' as _i655;
import 'package:domain/domain.dart' as _i494;
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
    gh.lazySingleton<_i494.OrderRepository>(() => _i155.OrderRepositoryImpl());
    gh.lazySingleton<_i494.ProductsRepository>(
        () => _i655.ProductRepositoryImpl());
    gh.lazySingleton<_i494.CompanyRepository>(
        () => _i56.CompanyRepositoryImpl());
    return this;
  }
}
