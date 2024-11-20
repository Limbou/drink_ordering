import 'package:equatable/equatable.dart';

abstract base class Currency extends Equatable {
  final String code;
  final String name;
  final String symbol;

  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  String format(String amount);

  @override
  List<Object?> get props => [code, name, symbol];
}

final class CurrencyUsd extends Currency {
  const CurrencyUsd() : super(code: 'USD', name: 'US Dollar', symbol: '\$');

  @override
  String format(String amount) {
    return '$symbol $amount';
  }
}

final class CurrencyEur extends Currency {
  const CurrencyEur() : super(code: 'EUR', name: 'Euro', symbol: '€');

  @override
  String format(String amount) {
    return '$symbol$amount';
  }
}

final class CurrencyPln extends Currency {
  const CurrencyPln() : super(code: 'PLN', name: 'Polish Zloty', symbol: 'zł');

  @override
  String format(String amount) {
    return '$amount $symbol';
  }
}
