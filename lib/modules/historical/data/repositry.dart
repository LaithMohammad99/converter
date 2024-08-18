import 'package:taske_bloc_converte/model/exchange_rate_model.dart';
import 'package:taske_bloc_converte/modules/historical/data/api.dart';

import '../../../utils/date.dart';

class HistoricalRepository {
  final HistoricalAPI historicalAPI = HistoricalAPI();

  Future<Map<String, List<ExchangeRateModel>>> fetchExchangeRates({required var startDate , required var endDate}) async {

    Map<String, List<ExchangeRateModel>> result = await historicalAPI
        .fetchExchangeRates(startDate: startDate, endDate: endDate);
    return result;
  }
}
