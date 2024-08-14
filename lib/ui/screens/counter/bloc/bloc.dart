import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:taske_bloc_converte/ui/screens/counter/bloc/events.dart';
import 'package:taske_bloc_converte/ui/screens/counter/bloc/states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int count = 0;

  CounterBloc() : super(InitialCounterState()) {
    on<CounterEvents>((event, emit) {
      if (event is IncrementCounterValue) {
        count = count + 1;
        emit(SuccessCounterState());
      } else if (event is DecrementCounterValue && count !=0) {
        count = count - 1;
        emit(SuccessCounterState());
      }
    });



  }
  static CounterBloc get(BuildContext context) =>
      BlocProvider.of(context); // get instance block
}
