import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDataDependencies() => getIt.init();
