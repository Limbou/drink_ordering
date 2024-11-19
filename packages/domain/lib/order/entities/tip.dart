enum Tip {
  small(0.15),
  medium(0.18),
  big(0.2);

  final double value;

  const Tip(this.value);

  String get valueDisplayable => '${(value * 100).toInt()}%';
}
