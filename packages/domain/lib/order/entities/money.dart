import 'package:domain/domain.dart';

final class Money {
  final int amount;
  final Currency currency;

  const Money._({
    required this.amount,
    required this.currency,
  });

  Money.fromDouble({
    required double amount,
    this.currency = const CurrencyUsd(),
  }) : amount = (amount * 100).toInt();

  Money withNewCurrency(Currency currency, Map<Currency, double> exchangeRates) {
    final oldExchangeRate = exchangeRates[this.currency] ?? 1.0;
    final newExchangeRate = exchangeRates[currency] ?? 1.0;
    final newAmount = (amount / oldExchangeRate * newExchangeRate).round();
    return Money._(amount: newAmount, currency: currency);
  }

  String get displayable {
    final amountString = (amount / 100).toStringAsFixed(2);
    return currency.format(amountString);
  }

  Money operator +(Money? other) {
    if (other == null) return this;
    if (currency != other.currency) {
      throw ArgumentError('Cannot add money of different currencies');
    }
    return Money._(amount: amount + other.amount, currency: currency);
  }

  Money operator -(Money? other) {
    if (other == null) return this;
    if (currency != other.currency) {
      throw ArgumentError('Cannot subtract money of different currencies');
    }
    final newAmount = amount - other.amount;
    final clampedAmount = newAmount < 0 ? 0 : newAmount;
    return Money._(amount: clampedAmount, currency: currency);
  }

  Money operator *(int multiplier) {
    return Money._(amount: amount * multiplier, currency: currency);
  }

  Money fraction(double fraction) {
    return Money._(amount: (amount * fraction).round(), currency: currency);
  }
}
