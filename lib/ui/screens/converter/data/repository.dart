import 'package:taske_bloc_converte/model/currency.dart';
import 'package:taske_bloc_converte/ui/screens/converter/data/data_provider.dart';

class ConvertRepository {
  GetDataFromApi getDataFromApi = GetDataFromApi();

  Future<double> requestExchangeRate(String from, String to) async {
    double result = await getDataFromApi.requestExchangeRate(from:from,to:to);
    return result;
  }

  Future<Map<String, Currency>> getCurrency()async {
    Map <String ,Currency> result = await getDataFromApi.getCurrecny();
    return result;
  }

}
