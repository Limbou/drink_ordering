import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Money', () {
    test('fromDouble creates Money with correct amount', () {
      final money = Money.fromDouble(amount: 123.45, currency: const CurrencyUsd());
      expect(money.amount, 12345);
      expect(money.currency, const CurrencyUsd());
    });

    test('displayable returns properly formatted string', () {
      final money = Money.fromDouble(amount: 123.45, currency: const CurrencyUsd());
      expect(money.displayable, '\$ 123.45');
    });

    test('withNewCurrency converts amount correctly', () {
      final money = Money.fromDouble(amount: 100.0, currency: const CurrencyUsd());
      final exchangeRates = {
        const CurrencyUsd(): 1.0,
        const CurrencyEur(): 0.9,
        const CurrencyPln(): 4.5,
      };

      final converted = money.withNewCurrency(const CurrencyEur(), exchangeRates);
      expect(converted.amount, 9000);
      expect(converted.currency, const CurrencyEur());

      final convertedPln = money.withNewCurrency(const CurrencyPln(), exchangeRates);
      expect(convertedPln.amount, 45000);
      expect(convertedPln.currency, const CurrencyPln());
    });

    test('operator + adds two Money objects of the same currency', () {
      final money1 = Money.fromDouble(amount: 50.0, currency: const CurrencyUsd());
      final money2 = Money.fromDouble(amount: 25.0, currency: const CurrencyUsd());

      final result = money1 + money2;
      expect(result.amount, 7500);
      expect(result.currency, const CurrencyUsd());
    });

    test('operator + throws error for different currencies', () {
      final money1 = Money.fromDouble(amount: 50.0, currency: const CurrencyUsd());
      final money2 = Money.fromDouble(amount: 25.0, currency: const CurrencyEur());

      expect(() => money1 + money2, throwsArgumentError);
    });

    test('operator - subtracts two Money objects of the same currency', () {
      final money1 = Money.fromDouble(amount: 50.0, currency: const CurrencyUsd());
      final money2 = Money.fromDouble(amount: 25.0, currency: const CurrencyUsd());

      final result = money1 - money2;
      expect(result.amount, 2500);
      expect(result.currency, const CurrencyUsd());
    });

    test('operator - clamps amount at 0 for negative results', () {
      final money1 = Money.fromDouble(amount: 20.0, currency: const CurrencyUsd());
      final money2 = Money.fromDouble(amount: 30.0, currency: const CurrencyUsd());

      final result = money1 - money2;
      expect(result.amount, 0);
      expect(result.currency, const CurrencyUsd());
    });

    test('operator - throws error for different currencies', () {
      final money1 = Money.fromDouble(amount: 50.0, currency: const CurrencyUsd());
      final money2 = Money.fromDouble(amount: 25.0, currency: const CurrencyEur());

      expect(() => money1 - money2, throwsArgumentError);
    });

    test('operator * multiplies the amount correctly', () {
      final money = Money.fromDouble(amount: 10.0, currency: const CurrencyUsd());
      final result = money * 3;

      expect(result.amount, 3000);
      expect(result.currency, const CurrencyUsd());
    });

    test('fraction calculates the correct fraction', () {
      final money = Money.fromDouble(amount: 100.0, currency: const CurrencyUsd());
      final result = money.fraction(0.25);

      expect(result.amount, 2500);
      expect(result.currency, const CurrencyUsd());
    });
  });

  group('Currency', () {
    test('CurrencyUsd formats correctly', () {
      final currency = const CurrencyUsd();
      expect(currency.format('123.45'), '\$ 123.45');
    });

    test('CurrencyEur formats correctly', () {
      final currency = const CurrencyEur();
      expect(currency.format('123.45'), '€123.45');
    });

    test('CurrencyPln formats correctly', () {
      final currency = const CurrencyPln();
      expect(currency.format('123.45'), '123.45 zł');
    });
  });
}
