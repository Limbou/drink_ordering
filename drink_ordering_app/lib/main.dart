import 'package:drink_ordering_app/app.dart';
import 'package:drink_ordering_app/injection/main_injection.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
