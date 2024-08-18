part of 'historical_bloc.dart';

@immutable
sealed class HistoricalState {}

final class HistoricalInitial extends HistoricalState {}

class ReceivedHistoricalData extends HistoricalState{} 
