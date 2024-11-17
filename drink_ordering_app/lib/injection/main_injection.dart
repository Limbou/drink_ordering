import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  configureDataDependencies();
  configureDomainDependencies();
  getIt.init();
}
