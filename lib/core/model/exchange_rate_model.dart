class ExchangeRateModel {
  final DateTime date;
  final double rate;

  ExchangeRateModel({required this.date, required this.rate});

  factory ExchangeRateModel.fromMap(Map<String, dynamic> map, String dateKey) {

    return ExchangeRateModel(
      date: DateTime.parse(dateKey),
      rate: map[dateKey],
    );
  }
}