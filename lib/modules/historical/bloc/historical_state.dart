part of 'historical_bloc.dart';

@immutable
sealed class HistoricalState {}
int index=0;

final class HistoricalInitial extends HistoricalState {}

class ReceivedHistoricalData extends HistoricalState{} 
