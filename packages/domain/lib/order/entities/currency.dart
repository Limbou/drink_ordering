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
}
