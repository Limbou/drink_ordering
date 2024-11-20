import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency', () {
    test('CurrencyUsd properties are correct', () {
      const currency = CurrencyUsd();
      expect(currency.code, 'USD');
      expect(currency.name, 'US Dollar');
      expect(currency.symbol, '\$');
    });

    test('CurrencyUsd formats correctly', () {
      const currency = CurrencyUsd();
      expect(currency.format('123.45'), '\$ 123.45');
    });

    test('CurrencyEur properties are correct', () {
      const currency = CurrencyEur();
      expect(currency.code, 'EUR');
      expect(currency.name, 'Euro');
      expect(currency.symbol, '€');
    });

    test('CurrencyEur formats correctly', () {
      const currency = CurrencyEur();
      expect(currency.format('123.45'), '€123.45');
    });

    test('CurrencyPln properties are correct', () {
      const currency = CurrencyPln();
      expect(currency.code, 'PLN');
      expect(currency.name, 'Polish Zloty');
      expect(currency.symbol, 'zł');
    });

    test('CurrencyPln formats correctly', () {
      const currency = CurrencyPln();
      expect(currency.format('123.45'), '123.45 zł');
    });

    test('Currency equality works correctly', () {
      const usd1 = CurrencyUsd();
      const usd2 = CurrencyUsd();
      const eur = CurrencyEur();

      expect(usd1, equals(usd2));
      expect(usd1, isNot(equals(eur)));
    });

    test('Currency hashCode matches properties', () {
      const usd = CurrencyUsd();
      const eur = CurrencyEur();

      expect(usd.hashCode, equals(CurrencyUsd().hashCode));
      expect(usd.hashCode, isNot(equals(eur.hashCode)));
    });
  });
}
