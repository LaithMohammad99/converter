class Currency {
  final String currencyName;
  final String currencySymbol;
  final String id;

  Currency({required this.currencyName, this.currencySymbol = '', required this.id});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyName: json['currencyName'],
      currencySymbol: json['currencySymbol'] ?? '',
      id: json['id'],
    );
  }
}