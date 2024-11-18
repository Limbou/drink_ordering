import 'package:drink_ordering_app/app.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  _setupSystemUiOverlayStyle();
  runApp(const App());
}

void _setupSystemUiOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
}
