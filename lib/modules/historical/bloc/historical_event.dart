part of 'historical_bloc.dart';

@immutable
sealed class HistoricalEvent {
  int index=0;

}

class GetHistoricalData extends HistoricalEvent{}
class GetHistoricalDataTwo extends HistoricalEvent{}