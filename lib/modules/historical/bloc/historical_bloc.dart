import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taske_bloc_converte/model/exchange_rate_model.dart';
import 'package:taske_bloc_converte/modules/converter/data/history_model.dart';
import 'package:taske_bloc_converte/modules/historical/data/repositry.dart';
import '../../../utils/date.dart';
part 'historical_event.dart';
part 'historical_state.dart';

class HistoricalBloc extends Bloc<HistoricalEvent, HistoricalState> {
  int index=0;

  Map<String, List<ExchangeRateModel>>? data;
  ExchangeRates? exchangeRates;

  HistoricalRepository historicalRepository = HistoricalRepository();

  HistoricalBloc() : super(HistoricalInitial()) {
    on<GetHistoricalData>((event, emit) async {
      var startDate = DateFunctions.formatDate(
          DateTime.now().subtract(const Duration(days: 6)));
      var endDate = DateFunctions.formatDate(DateTime.now());
      data = await historicalRepository.historicalAPI
          .fetchExchangeRates(startDate: startDate, endDate: endDate);
      emit(ReceivedHistoricalData());
    });
  }
}
