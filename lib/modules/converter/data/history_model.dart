class ExchangeRates {
  final Map<String, Map<String, double>> rates;

  ExchangeRates({required this.rates});

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    final usdJod = Map<String, double>.from(json['USD_JOD'] ?? {});
    final jodUsd = Map<String, double>.from(json['JOD_USD'] ?? {});

    return ExchangeRates(rates: {
      'USD_JOD': usdJod,
      'JOD_USD': jodUsd,
    });
  }
}