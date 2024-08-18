
class ExchangeRateModel {
  final String date;
  final double rate;

  ExchangeRateModel({required this.date, required this.rate});
}

class StaticExchangeRates {
  static final List<ExchangeRateModel> usdToJod = [
    ExchangeRateModel(date: '2024-08-10', rate: 0.708804),
    ExchangeRateModel(date: '2024-08-11', rate: 0.708795),
    ExchangeRateModel(date: '2024-08-12', rate: 0.708798),
    ExchangeRateModel(date: '2024-08-13', rate: 0.708698),
    ExchangeRateModel(date: '2024-08-14', rate: 0.708499),
    ExchangeRateModel(date: '2024-08-15', rate: 0.7087),
    ExchangeRateModel(date: '2024-08-16', rate: 0.708704),
    ExchangeRateModel(date: '2024-08-17', rate: 0.708704),
  ];

  static final List<ExchangeRateModel> jodToUsd = [
    ExchangeRateModel(date: '2024-08-10', rate: 1.410827),
    ExchangeRateModel(date: '2024-08-11', rate: 1.410846),
    ExchangeRateModel(date: '2024-08-12', rate: 1.41084),
    ExchangeRateModel(date: '2024-08-13', rate: 1.411038),
    ExchangeRateModel(date: '2024-08-14', rate: 1.411435),
    ExchangeRateModel(date: '2024-08-15', rate: 1.411035),
    ExchangeRateModel(date: '2024-08-16', rate: 1.411026),
    ExchangeRateModel(date: '2024-08-17', rate: 1.411026),
  ];
}