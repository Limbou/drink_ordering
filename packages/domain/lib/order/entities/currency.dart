final class Currency {
  final String code;
  final String name;
  final String symbol;

  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  const Currency.pln()
      : code = 'PLN',
        name = 'Polish Zloty',
        symbol = 'zł';

  const Currency.eur()
      : code = 'EUR',
        name = 'Euro',
        symbol = '€';

  const Currency.usd()
      : code = 'USD',
        name = 'US Dollar',
        symbol = '\$';
}
