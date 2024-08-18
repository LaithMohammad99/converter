import 'dart:convert';
import 'package:taske_bloc_converte/core/base_app_client/base_app_client.dart';
import 'package:taske_bloc_converte/model/currency.dart';
import 'package:http/http.dart' as http;


class GetDataConverterFromApi {

  late double conversionRate;
  BaseAppClient baseAppClient =
      BaseAppClient("https://free.currconv.com/");

  Future<double> requestExchangeRate(
      {required String from, required String to}) async {
    await baseAppClient.get(
        "api/v7/convert?q=${from.toUpperCase()}_${to.toUpperCase()}&compact=ultra&apiKey=a593c9f332b2f8c7af2e",
        onSuccess: (dynamic response, int? statusCode) {
      conversionRate = double.parse(response["${from.toUpperCase()}_${to.toUpperCase()}"].toString());
    }, onFailure: (String error, int? statusCode, {dynamic response}) {
      print("Request failed with error: $error");
    });
    return conversionRate;
  }


  Future<List<Currency>> getCurrecny() async {
    List<Currency> currency = [];


    http.Response response = await http.get(
        Uri.parse("https://free.currconv.com/api/v7/currencies?apiKey=a593c9f332b2f8c7af2e"));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['results'];
      data.forEach((key, value) {
        currency.add(Currency.fromJson(value));
      });
    }
    return currency;
  }




}
