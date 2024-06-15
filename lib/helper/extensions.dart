extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  double get toDouble => double.parse(this);
}

extension DoubleExtension on double {
  double toFahrenheit() => (this * 1.8 + 32).toDouble();
}
