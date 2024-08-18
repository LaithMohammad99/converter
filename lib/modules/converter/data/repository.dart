import 'package:taske_bloc_converte/model/currency.dart';
import 'package:taske_bloc_converte/modules/converter/data/data_provider.dart';

class ConvertRepository {
  GetDataConverterFromApi getDataFromApi = GetDataConverterFromApi();

  Future<double> requestExchangeRate(String from, String to) async {

    double result = await getDataFromApi.requestExchangeRate(from:from,to:to);
    return result;
  }

  Future<List<Currency>> getCurrency()async {
    List<Currency> result = await getDataFromApi.getCurrecny();
    return result;
  }


}
