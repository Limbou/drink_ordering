import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'domain_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDomainDependencies() => getIt.init();
