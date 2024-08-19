class Currency {
  final String currencyName;
  final String currencySymbol;
  final String id;

  Currency({
    required this.currencyName,
    this.currencySymbol = '',
    required this.id,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {

    return Currency(
      currencyName: json['currencyName'],
      currencySymbol: json['currencySymbol'] ?? '',
      id: json['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'currencyName': currencyName,
      'currencySymbol': currencySymbol,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      id: map['id'],
      currencyName: map['currencyName'],
      currencySymbol: map['currencySymbol'],
    );
  }
}