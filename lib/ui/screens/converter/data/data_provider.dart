import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taske_bloc_converte/core/base_app_client/base_app_client.dart';
import 'package:taske_bloc_converte/model/currency.dart';

class GetDataFromApi {
  late double conversionRate;
  BaseAppClient baseAppClient =
      BaseAppClient("https://free.currconv.com/", "a593c9f332b2f8c7af2e");

  Future<double> requestExchangeRate(
      {required String from, required String to}) async {
    await baseAppClient.get(
        "api/v7/convert?q=${from.toUpperCase()}_${to.toUpperCase()}&compact=ultra&apiKey=a593c9f332b2f8c7af2e",
        onSuccess: (dynamic response, int? statusCode) {
      conversionRate = double.parse(
          response["${from.toUpperCase()}_${to.toUpperCase()}"].toString());
    }, onFailure: (String error, int? statusCode, {dynamic response}) {
      print("Request failed with error: $error");
    });
    return conversionRate;
  }

  Map<String, Currency> result = {};

  Future<Map<String, Currency>> getCurrecny() async {
    await baseAppClient.get(
        "https://free.currconv.com/api/v7/currencies?apiKey=a593c9f332b2f8c7af2e",
        onSuccess: (dynamic response, int? statusCode) {
      final Map<String, dynamic> data = json.decode(response.body);
      final resultsJson = data['results'];
      result.addAll(
        resultsJson.map((key, value) => MapEntry(
              key,
              Currency.fromJson(value as Map<String, dynamic>),
            )),
      );
    }, onFailure: (String error, int? statusCode, {dynamic response}) {
      if (kDebugMode) {
        print("Request failed with error: $error");
      }
    });
    return result;
  }
}
