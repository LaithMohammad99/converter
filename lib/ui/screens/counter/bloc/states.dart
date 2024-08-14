abstract class CounterStates{
  const CounterStates();
}

class InitialCounterState extends CounterStates{}
class SuccessCounterState extends CounterStates{}
class ErrorCounterState extends CounterStates{
  final String error;
  ErrorCounterState (this.error);
}