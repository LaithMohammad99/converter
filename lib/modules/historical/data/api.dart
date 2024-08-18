import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taske_bloc_converte/utils/date.dart';
import 'package:taske_bloc_converte/model/exchange_rate_model.dart';

class HistoricalAPI {
  final http.Client? client;

  HistoricalAPI({this.client});
  Future<Map<String, List<ExchangeRateModel>>> fetchExchangeRates(
      {required var startDate, required var endDate}) async {
    Map<String, List<ExchangeRateModel>> exchangeRates = {
      'USD_JOD': [],
      'JOD_USD': []
    };
     final response = await http.get(Uri.parse(
        'https://free.currconv.com/convert?q=USD_JOD,JOD_USD&compact=ultra&date=$startDate&endDate=$endDate&apiKey=a593c9f332b2f8c7af2e'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      data['USD_JOD'].forEach((key, value) {
        exchangeRates['USD_JOD']!
            .add(ExchangeRateModel.fromMap(data['USD_JOD'], key));
      });

      data['JOD_USD'].forEach((key, value) {
        exchangeRates['JOD_USD']!
            .add(ExchangeRateModel.fromMap(data['JOD_USD'], key));
      });
    } else {}
    return exchangeRates;
  }
}
